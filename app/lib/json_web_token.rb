class JsonWebToken
    # Secret to encode and decode the token
    HMAC_SECRET = Rails.application.secrets.secret_key_base

    # Class method to encode the token
    def self.encode(payload, exp = 24.hours.from_now)
        # Set expiray to 24 hours from creation time
        payload[:exp] = exp.to_i

        # Sign the token with application secret
        JWT.encode(payload, HMAC_SECRET)
    end

    # Class method to decode the token
    def self.decode(token)
        # Get payload from first index of decoded array
        payload = JWT.decode(token, HMAC_SECRET)[0]
        HashWithIndifferentAccess.new payload

        # Rescue from all the errors caused by decoding 
    rescue JWT::DecodeError => e
        raise ExceptionHandler::InvalidToken, e.message
    end
end