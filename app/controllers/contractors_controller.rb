class ContractorsController < ApplicationController


    def index
        contractors = Contractor.all
        render json: contractors.all_users_serializer
    end

    def show
        contractor = Contractor.find(params[:id])
        render json: contractor
    end



end
