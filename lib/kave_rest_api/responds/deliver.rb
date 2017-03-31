module KaveRestApi
  class ResponseDeliver
    attr_reader :response, :status,:statusmessage
   
    def validate(response = nil)
      @response = response
      perform_validation
      return self
    end

    def valid?
      @valid
    end
    
    def entries(select=nil)
      if select.nil?
        return @response['entries']
      else
        return @response['entries'].select { |en|
        en['status'] == (KaveRestApi::ENTRIES[select].nil? ? select:KaveRestApi::ENTRIES[select])
        }
      end
    end
    
    def full_message_errors
      return KaveRestApi::ERRORS[@response['return']['status'].to_s]
    end

    private
    
    def perform_validation
      raise ArgumentError, 'not a valid response' if @response.nil?
      @valid = (@response['return']['status'] == 200)
    end
    
  end
  
end