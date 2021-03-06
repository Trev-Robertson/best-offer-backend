class ReviewsController < ApplicationController


    def index
        reviews = Review.all
        render json: reviews
    end

    def show
        review = Review.find(params[:id])
        render json: review
    end

    def create
        contractor = Contractor.find(params[:contractor_id])
        
          
        Review.create(review_params) 
        
        render json: contractor.contractor_serializer
    end


    private

        def review_params
            params.require(:review).permit(:user_id, :stars, :contractor_id, :content)
        end



end
