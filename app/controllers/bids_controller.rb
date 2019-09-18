class BidsController < ApplicationController


    def index
        bids = Bids.all
        render json: bids
    end

    def show
        bid = Bid.find(params[:id])
        render json: bid
    end




end
