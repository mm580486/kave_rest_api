module KaveRestApi
  class Cancel < KaveRestApi::RequestBase
    
    include Validatable
    attr_accessor :messageid
    attr_reader   :response
    validates_presence_of :messageid
    
    validates_format_of :messageid, :with => /^\d*$/, :if => Proc.new { !messageid.nil? }

    
    def initialize(args = {})
      super
      @ACTION_NAME    = [:countinbox,@FORMAT].join('.').freeze
      @messageid      = args.fetch(:startdate)
      if @messageid.kind_of?(Array)
        @valid= false if @messageid.length > 200
        @messageid    = @messageid.join(',') 
      end
      @messageid      = @messageid.ctsd
      
      @response       = ResponseCancel.new
    end
    
    def valid?
      @valid ||= true
    end
  
    def call
        connection = Faraday.new(url: "#{API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response FORMAT.to_sym
        end
         response = connection.get(ACTION_NAME,isread: @isread, linenumber: @linenumber,startdate: @startdate,enddate: @enddate)
         @response.validate(response.body)
    end
    
  end

end 
