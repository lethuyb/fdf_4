class Order < ActiveRecord::Base
  has_many :users
  has_many :order_details,
end
