class Api::V1::ContractorsController < ApplicationController





    def show
        token = request.headers["authentication"].split(" ")[1]
        @contractor = Contractor.find(decode_contractor(token)['user_id'])
        render json:@.contractor_serializer, status: :accepted
    end




    private
        def user_params
            params.require(:contractor).permit(:username, :password)
        end



end
