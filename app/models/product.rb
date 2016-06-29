class Product < ActiveRecord::Base
  belongs_to :categories
  has_many :order_details

  validates :productName, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: {maximum: 150}
  validates :quantity, presence: true
  validates :rating, presence: true
  validate :picture_size

  private
  def picture_size
    if self.images.size > Settings.admin.products.images_size.megabytes
      errors.add(:images, t("models.products.validate_images"))
    end
  end
end
