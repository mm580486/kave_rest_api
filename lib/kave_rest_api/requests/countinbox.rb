module KaveRestApi
  class CountInBox < KaveRestApi::RequestBase
    
    include Validatable
    attr_accessor :startdate,:linenumber,:enddate
    attr_reader   :response
    validates_presence_of :startdate
    validates_presence_of :linenumber
    validates_format_of :linenumber, :with => /^\d*$/, :if => Proc.new { !linenumber.nil? }
    validates_format_of :startdate, :with => /^\d*$/, :if => Proc.new { !unixdate.nil? }
    validates_format_of :enddate, :with => /^\d*$/, :if => Proc.new { !unixdate.nil? }
    
    def initialize(args = {})
      super
      @ACTION_NAME    = [:countinbox,@FORMAT].join('.').freeze
      @startdate      = args.fetch(:startdate)
      @enddate        = args.fetch(:enddate,nil)
      @linenumber     = args.fetch(:linenumber,nil)
      @isread         = args.fetch(:isread,nil)
      @response       = ResponseCountInBox.new
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
