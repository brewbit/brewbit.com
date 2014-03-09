require 'spree_core'
require 'spree_tumblr/engine'

module SpreeTumblr
  # Used to configure SpreeTumblr.
  #
  # Example:
  #
  #   Spree.config do |config|
  #     config.site_name = "An awesome Spree site"
  #   end
  #
  # This method is defined within the core gem on purpose.
  # Some people may only wish to use the Core part of Spree.
  def self.config(&block)
    yield(SpreeTumblr::Config)
  end
end