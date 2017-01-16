module Elastic::Response
  class BasicResponse
    def initialize(raw_response)
      @raw_response = raw_response
    end

    def response
      @raw_response
    end
    
  end
end
