module Spree
  class DeviceSessionsController < Brewbit::DeviceSessionsController
    helper Spree::BaseHelper
    helper Spree::StoreHelper
    include Spree::Core::ControllerHelpers::Auth
    include Spree::Core::ControllerHelpers::Common
    include Spree::Core::ControllerHelpers::Order
    
    layout 'brewbit/layouts/devices'
  end
end
