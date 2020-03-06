class Member < ApplicationRecord
    enum region: [:gold_coast, :brisbane, :ipswich, :sunshine_coast, :toowoomba]
    # belongs_to :user
end
