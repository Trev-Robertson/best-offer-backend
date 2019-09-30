class Api::V1::AuthController < ApplicationController
    
    
    
    def create
       
        if params[:new_user] == true
            @user = User.create(name: params[:name], password: params[:password])
            
        else
            @user = User.find_by({name: params[:name]})
        end
        
        if @user && @user.authenticate(params[:password])
            token = encode_user({user_id: @user.id})
         
           render json: {authenticated: true, 
            user: @user.user_serializer,
            token: token
            }, status: :accepted
       else
  
           render json: {authenticated: false}, status: :accepted, status: :unauthorized
       end
   end

   def create_contractor
  
    if params[:new_user] == true
        @contractor = Contractor.create(name: params[:name], password: params[:password])
        
    else
        @contractor = Contractor.find_by({name: params[:name]})
   
    end
   
    if @contractor && @contractor.authenticate(params[:password])
        token = encode_contractor({user_id: @contractor.id})
       
       render json: {authenticated: true, 
        user: @contractor.contractor_serializer,
        token: token
        }, status: :accepted
   else

       render json: {authenticated: false}, status: :accepted, status: :unauthorized
   end
end





end
