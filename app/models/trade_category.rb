class TradeCategory < ApplicationRecord

    belongs_to :user
    belongs_to :service
  
    def self.contains?(current_user, service)
      return current_user.service.where(id: service.id).length > 0
    end
  
    def self.create_trade_category(current_user, service)
      if current_user.services.where(id: service.id).length == 0
        current_user.services.push(service)
        current_user.save
      end
    end
  
    def self.trade_category_services(current_user, service)
      return TradeCategory.where("service_id = ? AND user_id = ?", service, current_user.id).first.id
    end
end
