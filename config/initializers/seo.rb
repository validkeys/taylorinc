# SEO related methods, like adding the to_permalink method to the String class.

require 'unicode'
class String
  def to_permalink
    str = Unicode.normalize_KD(self).gsub(/[^\x00-\x7F]/n,'')
    str = str.gsub(/[^-_\s\w]/, ' ').downcase.squeeze(' ').tr(' ','-').gsub(/-+$/,'')
    str[0..127]
  end
end