class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum region: [:gold_coast, :brisbane, :ipswich, :sunshine_coast, :toowoomba]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_one :member
  has_one :business
  has_many :services, through: :business

end
