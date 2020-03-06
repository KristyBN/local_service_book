class Business < ApplicationRecord
    enum service_region: [:gold_coast, :brisbane, :ipswich, :sunshine_coast, :toowoomba]
    belongs_to :user
    # belongs_to :member

    has_many :services, dependent: :destroy

end
