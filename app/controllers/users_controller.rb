class UsersController < ApplicationController
    before_action :authenticate_user!
    # all users
    def index
        @users = User.all
    end
    
end
