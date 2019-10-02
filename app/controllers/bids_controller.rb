class BidsController < ApplicationController


    def index
        bids = Bid.all
        render json: bids
    end

    def show
        bid = Bid.find(params[:id])
        render json: bid
    end

    def create
        message_body = params["Body"]
        from_number = params["From"]
            
        from_number.blank? ?  from_number = Rails.application.credentials.my_number : from_number
        boot_twilio
        contractor = Contractor.find(bid_params[:contractor_id])
        task = Task.find(bid_params[:task_id])
          bid =  Bid.create(bid_params) 
        @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, 
        body: "You Just Got A New Bid On Task '#{task.name}' for $#{bid.price}" )
      
          
        render json: contractor.contractor_serializer
    end
    


    def update
        message_body = params["Body"]
        from_number = params["From"]
        from_number.blank? ?  from_number = Rails.application.credentials.my_number : from_number
        boot_twilio
        bid = Bid.find(params[:id])
        bid.update(bid_params)
        task = Task.find(bid_params[:task_id])
        @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, 
        body: "You Just Got A New Bid On Task '#{task.name}' for $#{bid.price}" )
      
    
        render json: Contractor.find(bid_params[:contractor_id]).contractor_serializer
    end


    def destroy
        Bid.find(params[:id]).destroy
        render json: User.find(params[:user_id]).user_serializer
    end

    def delete_contracor_bid
           bid = Bid.find(bid_params[:id])
            bid.destroy
       
            render json: Contractor.find(bid_params[:contractor_id]).contractor_serializer
    end


    private
        def bid_params
            params.require(:bid).permit(:id, :task_id, :contractor_id, :price, :status)
        end


end
