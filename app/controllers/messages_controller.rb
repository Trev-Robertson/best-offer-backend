class MessagesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"
 
   def reply
  
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    params["Body"].split(',')
    byebug
 
    # sms = @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: "Thanks for your Bid of $#{message_body}. It was Successful" )
    
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
