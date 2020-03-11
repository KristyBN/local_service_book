class Service < ApplicationRecord
    enum category: ["Trades", "Entertainment", "Professional Services", "Health Fitness", "Carparking", "Hire Renting"]
    belongs_to :business
    has_one_attached :picture
    has_many :orders
end
