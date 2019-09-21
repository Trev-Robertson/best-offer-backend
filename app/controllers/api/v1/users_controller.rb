class Api::V1::UsersController < ApplicationController





    def show
   
       @user =  User.find_by({name: params[:name]})
        render json: @user.user_serializer, status: :accepted
    end




    private
        def user_params
            params.require(:user).permit(:username, :password)
        end



end
