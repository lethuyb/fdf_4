class Suggest < ActiveRecord::Base
  belongs_to :user

  validates :suggest, presence: true
end
