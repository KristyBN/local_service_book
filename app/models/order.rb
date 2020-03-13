class Order < ApplicationRecord
  # order must have a user
  belongs_to :user
  # users can order services and will be linked to the service
  belongs_to :service

end
