module ExceptionHandler
    extend ActiveSupport::Concern
    
    # Define custom subclasses - rescue catches only `StandardError`
    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken <StandardError; end

    included do
        rescue_from ActiveRecord::RecordNotFound do |error|
            json_response({message: error.message}, :not_found)
        end
        rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
        rescue_from ExceptionHandler::AuthenticationError, with: :unautherized_request
        rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
        rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    end

    private

    def four_twenty_two(e)
        json_response({message: e.message}, :unprocessable_entity)
    end

    def unautherized_request(e)
        json_response({message: e.message}, :unautherized)
    end
end