require 'spree/core'
require 'spree_auth_devise'
require 'csv'
require 'securerandom'

def read_csv(filename)
  csv_data = CSV.read filename
  headers = csv_data.shift.map {|i| i.to_s }
  string_data = csv_data.map {|row| row.map {|cell| cell.to_s } }
  array_of_hashes = string_data.map {|row| Hash[*headers.zip(row).flatten] }
end

def find_or_create_user(email)
  # load 'spree/user.rb'

  user = Spree::User.find_by_email(email.downcase)
  unless user
    puts "User #{email} not found"
    
    password = SecureRandom.hex
    attributes = {
      :password => password,
      :password_confirmation => password,
      :email => email,
      :login => email
    }
    user = Spree::User.new(attributes)
    user.save!
  end
  
  user
end

task :import_orders => :environment do
  orders = read_csv(ENV['ORDERS_CSV'])
  orders.each do |order|
    p order
    user = find_or_create_user order['email']
    
    address = {
      firstname: order['name'].split[0..-2].join(' '),
      lastname: order['name'].split.last,
      address1: order['addr1'],
      address2: order['addr2'],
      city: order['state'],
      zipcode: order['zip'],
      state_name: order['state'],
      country: { name: order['country_name'] },
      state: { name: order['state'] },
      phone: '1'
    }
    
    line_items = {}
    mt_qty = order['mt_qty'].to_i
    if mt_qty > 0
      sku = order['intl'].to_i == 1 ? 'BBMT-INT-V1' : 'BBMT-US-V1'

      line_items['mt'] = {
        quantity: mt_qty,
        sku: sku,
        #price: ,
        #currency: 'USD',
        #cost_price: ,
        #tax_category_id: ,
        #adjustment_total: ,
        #additional_tax_total: ,
        #promo_total: ,
        #included_tax_total: ,
        #pre_tax_amount: ,
      }
    end
    
    probe_qty = order['probe_qty'].to_i
    if probe_qty > 0
      line_items['probe'] = {
        quantity: probe_qty,
        sku: 'BBMT-PROBE',
      }
    end
    
    tshirt_m = order['tshirt_m']
    unless tshirt_m.blank?
      size_2_sku = {
        'S' => 'GI-M-S',
        'M' => 'GI-M-M',
        'L' => 'GI-M-L',
        'XL' => 'GI-M-XL',
        'XXL' => 'GI-M-XXL',
        'XXXL' => 'GI-M-XXXL',
      }
      line_items['tshirt_m'] = {
        quantity: 1,
        sku: size_2_sku[tshirt_m],
      }
    end
    
    tshirt_f = order['tshirt_f']
    unless tshirt_f.blank?
      size_2_sku = {
        'S' => 'GI-W-S',
        'M' => 'GI-W-M',
        'L' => 'GI-W-L',
        'XL' => 'GI-W-XL',
        'XXL' => 'GI-W-XXL',
      }
      line_items['tshirt_f'] = {
        quantity: 1,
        sku: size_2_sku[tshirt_f],
      }
    end
    
    begin
      order_date = DateTime.strptime(order['order_date'], '%m/%d/%Y %H:%M:%S')
    rescue
      order_date = DateTime.strptime(order['order_date'], '%Y/%m/%d, %H:%M')
    end
    
    params = {
      ship_address_attributes: address,
      bill_address_attributes: address,
      line_items_attributes: line_items,
      payments_attributes: [
        {
          amount: order['amount'].to_i,
          state: 'completed',
          payment_method: 'Kickstarter'
        }
      ],
      completed_at: order_date,
      state: 'complete'
    }
    puts params.inspect
    order = Spree::Order.build_from_api user, params
    order.save
  end
end
