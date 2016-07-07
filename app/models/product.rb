class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_details
  has_many :comments, dependent: :destroy

  validates :product_name, presence: true, uniqueness: {case_sensitive: false}
  validates :price, presence: true
  validates :description, presence: true, length: {maximum: 150}
  validates :quantity, presence: true
  validates :rating, presence: true
  validates :images, presence: true
  validates :category_id, presence: true

  scope :product_name, ->(product_name) do
      where("product_name LIKE ?", "%#{product_name}%") if product_name.present?
  end
  scope :price,
    ->(price){where(price: price) if price.present?}

  # scope :product_name,
  #   ->(product_name){where("product_name LIKE ?", "%#{product_name}%")}
  # scope :price,
  #   ->(price){where("price = ?", "#{price}")}

  private
  def images_size
    if self.images
      if self.images.size > Settings.admin.products.images_size.megabytes
        self.errors.add :images, I18n.t("models.products.validate_images")
      end
    else
      self.errors.add :images, I18n.t("admin.products.add_image_error")
    end
  end
end
