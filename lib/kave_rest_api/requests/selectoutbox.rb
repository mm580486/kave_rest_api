module KaveRestApi
  class SelectOutBox < KaveRestApi::RequestBase
    
    include Validatable
    attr_accessor :startdate,:sender,:enddate
    attr_reader   :response
    validates_presence_of :startdate
    validates_format_of :sender, :with => /^\d*$/, :if => Proc.new { !sender.nil? }
    validates_format_of :startdate, :with => /^\d*$/, :if => Proc.new { !unixdate.nil? }
    validates_format_of :enddate, :with => /^\d*$/, :if => Proc.new { !unixdate.nil? }
    
    def initialize(args = {})
      super
      @ACTION_NAME    = [:selectoutbox,@FORMAT].join('.').freeze
      @startdate   = args.fetch(:startdate)
      @enddate     = args.fetch(:enddate,nil)
      @sender      = args.fetch(:sender,nil)
      @response    = ResponseSelectOutBox.new
    end
  
    def call
        connection = Faraday.new(url: "#{API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response FORMAT.to_sym
        end
         response = connection.get(ACTION_NAME, sender: @sender,startdate: @startdate,enddate: @enddate)
         @response.validate(response.body)
    end
    
  end

end 
