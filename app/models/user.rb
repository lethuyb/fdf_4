class User < ActiveRecord::Base
  belongs_to :order
  has_many :comments
  has_many :suggests
end
