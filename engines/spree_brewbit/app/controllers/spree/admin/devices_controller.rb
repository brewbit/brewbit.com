require 'device'

module Brewbit
  module Admin
    class DevicesController < Spree::Admin::BaseController

      def index
        @devices = ::Device.all
      end
    end
  end
end
