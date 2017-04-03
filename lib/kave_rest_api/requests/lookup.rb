module KaveRestApi
  class Lookup < KaveRestApi::RequestBase
    include Validatable
    attr_accessor :receptor, :message,:unixdate,:type,:date,:localid,:sender
    attr_reader   :response,:message_size
    validates_presence_of :token
    validates_presence_of :receptor
    validates_length_of :message, :within => 1..140
    validates_format_of :sender, :with => /^\d*$/, :if => Proc.new { !sender.nil? }
    validates_format_of :unixdate, :with => /^\d*$/, :if => Proc.new { !unixdate.nil? }
    
    def initialize(args = {})
      super
      @ACTION_NAME    = [:lookup,@FORMAT].join('.').freeze
      @receptor    = args.fetch(:receptor)
      @receptor    = @receptor.ctsd
      @valid_receptor = @receptor.is_phone? 
      @token       = args.fetch(:token)
      @token2      = args.fetch(:token2,nil)
      @token3      = args.fetch(:token3,nil)
      @template    = args.fetch(:template)
      @type        = args.fetch(:type,'sms')
      @response    = ResponseLookup.new
    end
    
    def valid_message?
      @valid_message ||= true
    end
    
    def valid_receptor?
      @valid_receptor
    end
    
    def call
        connection = Faraday.new(url: "#{@API_URL}/verify/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response @FORMAT.to_sym
        end
         response = connection.get(@ACTION_NAME, receptor: @receptor , message: @message,localid: @localid,sender: @sender,date: @date,type: @type)
         @response.validate(response.body)
    end
    
  end

end 
