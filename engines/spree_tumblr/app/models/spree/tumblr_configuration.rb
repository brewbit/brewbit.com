module Spree
  class TumblrConfiguration < Preferences::Configuration
    preference :blog_name, :string
    preference :api_key, :string
  end
end
