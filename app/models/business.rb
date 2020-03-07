class Business < ApplicationRecord
    enum service_region: [:gold_coast, :brisbane, :ipswich, :sunshine_coast, :toowoomba]
    belongs_to :user

    has_many :services, dependent: :destroy

end
