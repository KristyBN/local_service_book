class TradeCategoryController < ApplicationController
    before_action :authenticate_user!

    def index
        # @services = current_user.services
        @services = Service.all
    end

    def edit
        @trade_category = Service.find(Service.trade_category_id(params[:id]))
    end

    def update
        @trade_category = Service.find(params[:id])
        if @trade_category.save
            flash[:notice] = "Updated"
            redirect_trade_category_services_path
        end
    end


end
