class BidsController < ApplicationController


    def index
        bids = Bid.all
        render json: bids
    end

    def show
        bid = Bid.find(params[:id])
        render json: bid
    end

    def update
       
        bid = Bid.find(params[:id])
        bid.update(bid_params)
        render json: User.find(params[:user_id]).user_serializer
    end


    def destroy
        Bid.find(params[:id]).destroy
        render json: User.find(params[:user_id]).user_serializer
    end


    private
        def bid_params
            params.require(:bid).permit(:id, :task_id, :contractor_id, :price, :status)
        end

end
