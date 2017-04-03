module KaveRestApi
  class Receive < KaveRestApi::RequestBase

    def initialize(args = {})
      super
      @ACTION_NAME    = [:receive,@FORMAT].join('.').freeze
      @linenumber   = args.fetch(:linenumber,@DEFAULT_SENDER)
      @isread       = args.fetch(:isread,0)
      @response     = ResponseReceive.new
    end
  
    def call
        connection = Faraday.new(url: "#{@API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response @FORMAT.to_sym
        end
         response = connection.get(@ACTION_NAME)
         @response.validate(response.body)
    end
    
  end

end 
