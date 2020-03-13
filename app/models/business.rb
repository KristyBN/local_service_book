class Business < ApplicationRecord
    # enum for areas serviced will be used later to match users with local services
    enum service_region: [:gold_coast, :brisbane, :ipswich, :sunshine_coast, :toowoomba]
    # business has one user
    belongs_to :user
    # a business can have many services
    has_many :services, dependent: :destroy

end
