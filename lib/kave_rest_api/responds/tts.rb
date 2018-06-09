module KaveRestApi
  class ResponseTts
    attr_reader :response, :status,:statustext
   
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
        return @response['entries'].select { |entry|
        entry['status'] == (KaveRestApi::ENTRIES[select].nil? ? select:KaveRestApi::ENTRIES[select])
        }
      end
    end
    
    def full_message_errors
      return KaveRestApi::ERRORS[@response['return']['message'].to_s]
    end

    private
    
    def perform_validation
      raise ArgumentError, 'not a valid response' if @response.nil?
      @valid = (@response['return']['status'] == 200)
    end
    
  end
  
end