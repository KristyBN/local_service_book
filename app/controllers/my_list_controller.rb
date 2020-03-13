class MyListController < ApplicationController
    before_action :authenticate_user!

    def index
        @services = current_user.business.services
    end

    def edit
        @my_list = MyList.find(MyList.my_list_id(current_user,params[:id]))
    end

    def update
        @my_list = MyList.find(params[:id])
        if @my_list_item.save
            flash[:notice] = "Updated"
            redirect_to my_list_path
        end
    end


end
