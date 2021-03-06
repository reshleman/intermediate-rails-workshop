class User < ActiveRecord::Base
  include Following

  has_many :shouts

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true
end
