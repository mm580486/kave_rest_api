module KaveRestApi
  class ResponseCountInBox
    attr_reader :response, :status,:statusmessage
    attr_accessor :apilogs,:dailyreport,:debugmode,:defaultsender,:mincreditalarm,:resendfailed

    def validate(response = nil)
      @response = response
      perform_validation
      return self
    end

    def valid?
      @valid
    end
    
    def entries
        return @response['entries']
    end
    
    def full_message_errors
      return KaveRestApi::ERRORS[@response['return']['status'].to_s]
    end

    private
    
    def perform_validation
      raise ArgumentError, 'not a valid response' if @response.nil?
      @valid = (@response['return']['status'] == 200)
      @response['entries'].each { |key, value| send("#{key}=", value) }
    end
    
  end
  
end