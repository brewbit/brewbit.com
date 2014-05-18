module Spree
  class DevicesController < Brewbit::DevicesController
    helper Spree::BaseHelper
    helper Spree::StoreHelper
    include Spree::Core::ControllerHelpers::Auth
    include Spree::Core::ControllerHelpers::Common
    include Spree::Core::ControllerHelpers::Order
    
    layout :resolve_layout
  end
end
