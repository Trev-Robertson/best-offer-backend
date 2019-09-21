class Api::V1::UsersController < ApplicationController





    def show
        token = request.headers["authentication"].split(" ")[1]
        # byebug
        @user = User.find(decode(token)['user_id'])
        render json: @user.user_serializer, status: :accepted
    end




    private
        def user_params
            params.require(:user).permit(:username, :password)
        end



end
