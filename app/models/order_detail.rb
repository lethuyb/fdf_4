class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  before_save :finalize
  validates :quantity_ordered, presence: true,
    numericality: { only_integer: true, greater_than: 0 }

  def unit_price
    if persisted?
      self[:price_each]
    else
      product.price
    end
  end

  def total_price
    price_each * quantity_ordered
  end

  private
  def finalize
    self[:price_each] = price_each
    self[:total_price] = quantity_ordered * self[:price_each]
  end
end
