module KaveRestApi
  class Info
    ACTION_NAME    = [:info,FORMAT].join('.').freeze

    def initialize(args = {})
      @response     = ResponseInfo.new
    end
  
    def call
        connection = Faraday.new(url: "#{API_URL}/account/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response FORMAT.to_sym
        end
         response = connection.get(ACTION_NAME)
         @response.validate(response.body)
    end
    
  end

end 
