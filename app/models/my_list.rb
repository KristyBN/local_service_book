class MyList < ApplicationRecord
  belongs_to :user
  belongs_to :business
  has_many :services

  def self.contains?(current_user, service)
    return current_user.services.where(id: service.id).length > 0
  end

  def self.create_my_list(current_user, service)
    if current_user.services.where(id: service.id).length == 0
      current_user.services.push(service)
      current_user.save
    end
  end

  def self.my_list_service(current_user, business, service)
    return MyList.where("service_id = ? AND user_id = ? AND business_id", business, service, current_user.id).first.id
  end

end
