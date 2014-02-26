# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  config.site_name = 'BrewBit'
  config.logo = 'logo/brewbit.png'
  config.admin_interface_logo = 'logo/brewbit.png'
end

Spree.user_class = "Spree::User"

SpreeTumblr::Config.blog_name = 'brewbit'
SpreeTumblr::Config.api_key = ENV['TUMBLR_API_KEY']
