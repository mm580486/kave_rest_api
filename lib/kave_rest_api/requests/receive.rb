module KaveRestApi
  class Receive < KaveRestApi::RequestBase
    attr_accessor :linenumber, :isread
    attr_reader   :response
    include Validatable
    validates_presence_of :linenumber
    validates_presence_of :isread
    validates_format_of :isread, :with => /^[01]$/, :if => Proc.new { !isread.nil? }
    
    def initialize(args = {})
      super
      @ACTION_NAME  = [:receive,@FORMAT].join('.').freeze
      @linenumber   = args.fetch(:linenumber,@DEFAULT_SENDER)
      @isread       = args.fetch(:isread,0)
      @response     = ResponseReceive.new
    end
  
    def call
        connection = Faraday.new(url: "#{@API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response @FORMAT.to_sym
        end
         response = connection.get(@ACTION_NAME,linenumber: @linenumber,isread: @isread)
         @response.validate(response.body)
    end
    
  end

end 
