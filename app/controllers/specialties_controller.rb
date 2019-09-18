class SpecialtiesController < ApplicationController


    def index
        specialties = Specialty.all
        render json: specialties
    end

    def show
        specialty = Specialty.find(params[:id])
        render json: specialty
    end


end
