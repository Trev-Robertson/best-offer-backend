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


end
