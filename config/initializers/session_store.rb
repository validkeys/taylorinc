# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_taylor-group_session',
  :secret      => '226e7bd21139818eaa3b7044b1b205fbbd597240629906f57a96a240162d67db3364e1074cc8ce97ce05e515a0ebe697522ce5f7336cdd46aaa22b446430d600'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
