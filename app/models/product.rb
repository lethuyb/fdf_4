class Product < ActiveRecord::Base
  belongs_to :categories
  has_many :order_details
end
