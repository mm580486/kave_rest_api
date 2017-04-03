module KaveRestApi
  class Config < KaveRestApi::RequestBase
    
    include Validatable
    attr_accessor :apilogs,:dailyreport,:debugmode,:defaultsender,:mincreditalarm,:resendfailed
    attr_reader   :response

    def initialize(args = {})
      @ACTION_NAME    = [:config,@FORMAT].join('.').freeze
      @apilogs          = args.fetch(:apilogs,nil)
      @dailyreport      = args.fetch(:dailyreport,nil)
      @debugmode        = args.fetch(:debugmode,nil)
      @defaultsender    = args.fetch(:defaultsender,nil)
      @mincreditalarm   = args.fetch(:mincreditalarm,nil)
      @resendfailed     = args.fetch(:resendfailed,nil)
      @response         = ResponseConfig.new
    end
    
    def valid?
      @valid
    end
    
    def full_message_errors
      
    end
  
    def call
        connection = Faraday.new(url: "#{@API_URL}/account/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response @FORMAT.to_sym
        end
         response = connection.get(@ACTION_NAME,apilogs: @apilogs,dailyreport: @dailyreport,debugmode: @debugmode,defaultsender: @defaultsender,mincreditalarm: @mincreditalarm,resendfailed: @resendfailed)
         @response.validate(response.body)
    end
    
    
    
    
  end

end 
