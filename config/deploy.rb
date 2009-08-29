set :application, "taylor-group"
set :user, "deploy"
# can't seem to get the local repo to reolve with cap, so we're doing something silly, sshing to myself
set :repository,  "ssh://#{user}@#{application}.com:30000/~/git/#{application}.git"

set :deploy_to, "/var/www/#{application}"

# using git
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache

ssh_options[:port] = 30000

set :domain, "#{application}.com"
role :app, domain
role :web, domain
role :db, domain, :primary => true

#after tasks
after "deploy:symlink", "custom_symlinks:link_shared"

#############################################################
#	mod_rails / Passenger
#############################################################

namespace :mod_rails do
  desc "Restart the application altering tmp/restart.txt for mod_rails."
  task :restart, :roles => :app do
    run "touch  #{current_path}/tmp/restart.txt"
    # releases old spawn server for conserving memory during deployment
    # run "kill $( passenger-memory-stats | grep 'Passenger spawn server' | awk '{ print $1 }' )"
  end
end

namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
end

#############################################################
#	Symlinks
#############################################################
namespace :custom_symlinks do
  desc "Symlink shared files / dirs"
  task :link_shared do
    run "rm -rf #{current_path}/public/attachments"
    run "ln -nsf #{shared_path}/attachments #{current_path}/public/attachments"
    run "rm -rf #{current_path}/config/database.yml"
    run "ln -nsf #{shared_path}/database.yml #{current_path}/config/database.yml"
    run "rm -rf #{current_path}/config/initializers/session_store.rb"
    run "ln -nsf #{shared_path}/session_store.rb #{current_path}/config/initializers/session_store.rb"
  end
end

#############################################################
#	Backup
#############################################################
namespace :backup do
  
  desc "Download production db dump and shared assets"
  task :bootstrap do
    self.db
    self.attachments
  end

  desc "Backup and grab the database" 
  task :db, :roles => :db, :only => { :primary => true } do
    filename = "/tmp/#{application}.dump.#{Time.now.to_f}.sql.bz2" 
    on_rollback { delete filename }
    run "mysqldump -u root #{application} | bzip2 -c > #{filename}" 
    get filename, "#{File.dirname(__FILE__)}/../db/backup.sql.bz2" 
    run "rm -rf filename"
  end
  
  desc "Download a tarball of the attachments (uploads)"
  task :attachments, :roles => :app do
    filename = "/tmp/#{application}-attachments.#{Time.now.to_f}.tar.bz2" 
    on_rollback { run "rm -rf #{filename}" }
    run "tar -cjf #{filename} -C #{shared_path}/attachments ."
    get filename, "#{File.dirname(__FILE__)}/../public/attachments/backup.tar.bz2" 
    run "rm -rf #{filename}"
  end

end