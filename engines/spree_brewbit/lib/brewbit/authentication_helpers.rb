module Brewbit
  module AuthenticationHelpers
    def self.included(receiver)
      receiver.send :helper_method, :brewbit_current_user
    end

    def brewbit_current_user
      spree_current_user
    end
  end
end
