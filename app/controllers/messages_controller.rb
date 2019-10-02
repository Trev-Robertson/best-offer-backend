class MessagesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"
 
   def reply
      
    message_body = params["Body"]
    from_number = params["From"]
        
    from_number.blank? ?  from_number = Rails.application.credentials.my_number : from_number
    
    contractor = Contractor.find_by(phone_number: from_number)
    boot_twilio
    if message_body.strip.downcase === 'tasks'
       
      @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: 
      "Please use these codes when bidding on a task, in the format of 'code, bid amount'. ex: (1, 200) : \n \n #{contractor.tasks.map {|task| "Code: #{task.id}, for Task Name: #{task.name}" }.join(", \n \n ") }  " )

    else
    
      results = Message.return_task_and_bid_amount(message_body, contractor)
    
        if results
          @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: "Thanks for your Bid of $#{results[1].price} for Task '#{results[0].name}'. \n It was Successful" )
          
          from_number = results[2].phone_number
          from_number.blank? ?  from_number = Rails.application.credentials.my_number : from_number
          @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: "You Just Got A New Bid On Task #{results[0].name} for $#{results[1].price}" )

        else
          sms = @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: "Unsuccessdul Bid Attempt. Please Try Again" )

        end

    end
   end


   def create_message
  
    to_number = ''
    @client.messages.create(
      from: Rails.application.credentials.twilio_number,
      to: to_number,
      body: "Encrypted Key"
      )
   end
 
   private
 
   def boot_twilio
     account_sid = Rails.application.credentials.twilio_sid
     auth_token = Rails.application.credentials.twilio_token
     @client = Twilio::REST::Client.new account_sid, auth_token
    end
end
