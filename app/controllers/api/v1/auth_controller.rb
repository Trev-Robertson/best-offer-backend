class Api::V1::AuthController < ApplicationController
    
    
    
    def create
        @user = User.find_by({name: params[:name]})
        
       if @user && @user.authenticate(params[:password])
        
           render json: {authenticated: true, user: @user.user_serializer}, status: :accepted
       else
  
           render json: {authenticated: false}, status: :accepted, status: :unauthorized
       end
   end
end
