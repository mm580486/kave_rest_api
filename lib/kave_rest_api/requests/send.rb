module KaveRestApi
  class SendSimple < KaveRestApi::RequestBase
    include Validatable
    attr_accessor :receptor, :message,:unixdate,:type,:date,:localid,:sender
    attr_reader   :response,:message_size,:config
    validates_presence_of :message
    validates_presence_of :receptor
    validates_length_of :message, :within => 1..140
    validates_format_of :sender, :with => /^\d*$/, :if => Proc.new { !sender.nil? }
    validates_format_of :unixdate, :with => /^\d*$/, :if => Proc.new { !unixdate.nil? }
    
    def initialize(args = {})
      super
      @ACTION_NAME    = [:send,@FORMAT].join('.').freeze
      @receptor    = args.fetch(:receptor)
      
      if @receptor.kind_of?(Array)
        @valid_receptor= false if @receptor.length > 200
        @receptor      = @receptor.join(',') 
      end
      @receptor    = @receptor.ctsd
      @date        = args.fetch(:date,nil)
      @message     = args.fetch(:message)
      @message     = @message.ctsd if args.fetch(:standard_digit,false)
      @unixdate    = args.fetch(:unixdate,nil) 
      @type        = args.fetch(:type,nil)
      @localid     = args.fetch(:localid,nil)
      @sender      = args.fetch(:sender,@DEFAULT_SENDER)
      @response    = ResponseSendSimple.new
      @message_size=@message.multibyte? ? 268:612
      @valid_message= (@message.length > @message_size ) ? false:true
    end
    
    def valid_message?
      @valid_message
    end
    
    def valid_receptor?
      @valid_receptor
    end
    
    def call
        connection = Faraday.new(url: "#{@API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response @FORMAT.to_sym
        end
        
          response = connection.get(@ACTION_NAME, receptor: @receptor , message: @message,localid: @localid,sender: @sender,date: @date,type: @type)
          @response.validate(response.body)
    end
    
  end

end 
