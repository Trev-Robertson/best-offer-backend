class MessagesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"
 
   def reply
      
    message_body = params["Body"]
    from_number = params["From"]
    contractor = Contractor.find_by(phone_number: params["From"] )
    boot_twilio
    if message_body.strip.downcase === 'tasks'
       
      @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: 
      "Please use these codes when bidding on a task: #{contractor.tasks.map {|task| "Code: #{task.id} for Task: #{task.name}" } }" )

    else
    
      results = Message.return_task_and_bid_amount(message_body, contractor)
    
        if results
          sms = @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: "Thanks for your Bid of $#{results[1].price} for Task '#{results[0].name}'. It was Successful" )
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
