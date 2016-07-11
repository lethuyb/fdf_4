class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :comment, presence: true, length: {maximum: 500}
end
