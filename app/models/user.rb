class User < ActiveRecord::Base
  attr_accessor :remember_token
  belongs_to :order
  has_many :comments
  has_many :suggests

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attributes :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new remember_digest.is_password? remember_token
  end

  def forget
    update_attributes :remember_digest, nil
  end
end
