class User < ApplicationRecord
  # enum used for selection of users location this will later be used within a search function
  enum region: [:gold_coast, :brisbane, :ipswich, :sunshine_coast, :toowoomba]
  # devise related to the user setup and storing info and name and password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # a business must belond to a user
  has_one :business
  # a business can have many services
  has_many :services, through: :business

end
