class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_details
  has_many :products, through: :order_details

  before_save :update_total_pay

  def total_pay
    order_details.collect do |li|
      li.valid? ? (li.quantity_ordered * li.price_each) : 0
    end.sum
  end

  private
  def update_total_pay
    self[:total] = total_pay
  end
end
