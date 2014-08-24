module Spree
  module Admin
    ReportsController.class_eval do
      def ca_sales_total
        params[:q] = {} unless params[:q]
    
        if params[:q][:completed_at_gt].blank?
          params[:q][:completed_at_gt] = Time.zone.now.beginning_of_month
        else
          params[:q][:completed_at_gt] = Time.zone.parse(params[:q][:completed_at_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
        end
    
        if params[:q] && !params[:q][:completed_at_lt].blank?
          params[:q][:completed_at_lt] = Time.zone.parse(params[:q][:completed_at_lt]).end_of_day rescue ""
        end
    
        params[:q][:s] ||= "completed_at desc"
    
        params[:q][:billing_address_state_name] = 'California'
        @search = Order.complete.ransack(params[:q])
        @orders = @search.result.includes(:bill_address)
    
        @totals = {}
        @orders.each do |order|
          @totals[order.currency] = { :item_total => ::Money.new(0, order.currency), :adjustment_total => ::Money.new(0, order.currency), :sales_total => ::Money.new(0, order.currency) } unless @totals[order.currency]
          @totals[order.currency][:item_total] += order.display_item_total.money
          @totals[order.currency][:adjustment_total] += order.display_adjustment_total.money
          @totals[order.currency][:sales_total] += order.display_total.money
        end
        
        
        
        
        #Spree::Order.complete.joins(:billing_address).where("state_name = 'California'")
      end
    end    
  end
end
