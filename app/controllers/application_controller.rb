class ApplicationController < ActionController::API





    def secret_key_user
        Rails.application.credentials.dig(:secret_auth_key_for_users)
    end


    def secret_key_contractor
        Rails.application.credentials.dig(:secret_auth_key_for_contractors)
    end


    def encode_user(payload)
        JWT.encode(payload, secret_key_user, 'HS512')
    end

    def encode_contractor(payload)
        JWT.encode(payload, secret_key_contractor, 'HS512')
    end
    
    def decode_user(token)
        JWT.decode(token, secret_key_user, true, {algorithm: 'HS512'})[0]
    end
    
    def decode_contractor(token)
        JWT.decode(token, secret_key_contractor, true, {algorithm: 'HS512'})[0]
    end

        def reply
        byebug
        message_body = params["Body"]
        from_number = params["From"]
        
        boot_twilio
     
        sms = @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, body: "You Just Got A New Bid On A Task" )
        render json: User.find(1)
       end
    
    
       def create_message
        byebug
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
