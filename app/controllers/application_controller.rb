class ApplicationController < ActionController::API


    def secret_key
        Rails.application.credentials.dig(:secret_auth_key)
    end

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS512')
    end
    
    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: 'HS512'})[0]
    end


end
