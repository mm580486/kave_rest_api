module KaveRestApi
  class Tts < KaveRestApi::RequestBase
    include Validatable
    attr_accessor :receptor, :message,:date,:localid,:repeat
    attr_reader   :response,:message,:config,:status,:statustext,:sender,:receptor,:date,:cost
    validates_presence_of :message
    validates_presence_of :receptor
    validates_length_of :message, :within => 1..500


    
    def initialize(args = {})
      super
      @ACTION_NAME    = [:maketts,@FORMAT].join('.').freeze
      @receptor    = args.fetch(:receptor)
      if @receptor.kind_of?(Array)
        @valid_receptor= false if @receptor.length > 200
        @receptor      = @receptor.join(',') 
      end
      @receptor    = @receptor.ctsd
      @date        = args.fetch(:date,nil)
      @message     = args.fetch(:message)
      @message     = @message.ctsd if args.fetch(:standard_digit,false)
      @repeat      = args.fetch(:repeat,nil)
      @localid     = args.fetch(:localid,nil)
      @response    = ResponseSendSimple.new
    end
    
    def valid_receptor?
      @valid_receptor
    end
    
    def call
        connection = Faraday.new(url: "#{@API_URL}/call/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response @FORMAT.to_sym
        end
        
          response = connection.get(@ACTION_NAME, receptor: @receptor , message: @message,localid: @localid,date: @date,repeat: @repeat)
          @response.validate(response.body)
    end
    
  end

end 
