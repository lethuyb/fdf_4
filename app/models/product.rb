class Product < ActiveRecord::Base
  belongs_to :categories, dependent: :destroy
  belongs_to :order_detail
  has_many :comments, dependent: :destroy
  has_many :order, through: :order_details

  validates :product_name, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: {maximum: 150}
  validates :quantity, presence: true
  validates :rating, presence: true
  validates :images, presence: true
  validate :images_size

  scope :product_name,
    ->(product_name){where("product_name LIKE ?", "%#{product_name}%")}
  scope :price,
    ->(price){where("price = ?", "#{price}")}

  private
  def images_size
    if images.present?
      if self.images.size > Settings.admin.products.images_size.megabytes
        errors.(add :images, t("models.products.validate_images"))
      end
    end
  end
end
