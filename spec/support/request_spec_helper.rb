# spec/support/request_spec_helper
module RequestSpecHelper
    # Parse JSON response to ruby Hash
    def json
        JSON.parse(response.body)
    end    
end