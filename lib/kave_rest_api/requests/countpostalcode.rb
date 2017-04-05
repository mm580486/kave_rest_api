module KaveRestApi
  class CountPostalCode < KaveRestApi::RequestBase
    
    include Validatable
    attr_accessor :postalcode
    attr_reader   :response
    validates_presence_of :postalcode
    
    validates_format_of :postalcode, :with => /^\d*$/, :if => Proc.new { !messageid.nil? }

    
    def initialize(args = {})
      super
      @ACTION_NAME    = [:countpostalcode,@FORMAT].join('.').freeze
      @postalcode     = args.fetch(:postalcode)
      @postalcode     = @postalcode.ctsd
      
      @response       = ResponseCountPostalCode.new
    end
    
   
  
    def call
        connection = Faraday.new(url: "#{API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response FORMAT.to_sym
        end
         response = connection.get(ACTION_NAME,countpostalcode: @countpostalcode)
         @response.validate(response.body)
    end
    
  end

end 
