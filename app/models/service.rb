class Service < ApplicationRecord
    # enum used to select service category
    enum category: ["Trades", "Entertainment", "Professional Services", "Health Fitness", "Carparking", "Hire Renting"]
    # services must belond to a business
    belongs_to :business
    # business can add an image to the form to display in listing stored in AWS
    has_one_attached :picture
    # a service can be ordered many times
    has_many :orders
end
