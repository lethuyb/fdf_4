class Product < ActiveRecord::Base
  belongs_to :categories
  has_many :order_details

  validates :product_name, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: {maximum: 150}
  validates :quantity, presence: true
  validates :rating, presence: true
  validate :images_size

  private
  def images_size
    if self.images.size > Settings.admin.products.images_size.megabytes
      errors.(add :images, t("models.products.validate_images"))
    end
  end
end
