class Category < ActiveRecord::Base
  has_many :products

  validates :category_name, presence: true, uniqueness: {case_sensitive: false}
end
