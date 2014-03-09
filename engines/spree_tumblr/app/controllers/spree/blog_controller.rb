require 'httparty'

class Spree::BlogController < Spree::StoreController
  before_filter :get_posts, :only => :index

  def index
  end

  def show
    @post = get_posts( id: "#{params[:id]}" )
  end

  private

  def get_posts( options = {} )
    options = {api_key: SpreeTumblr::Config.api_key}.merge(options)
    response = HTTParty.get( "http://api.tumblr.com/v2/blog/#{SpreeTumblr::Config.blog_name}.tumblr.com/posts/text", query: options )

    if response["meta"]["status"] == 200
      @posts = response["response"]["posts"]
    else
      []
    end
  end
end
