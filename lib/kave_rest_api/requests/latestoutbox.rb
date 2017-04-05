module KaveRestApi
  class LatestOutBox < KaveRestApi::RequestBase
    include Validatable
    attr_accessor :pagesize,:sender
    attr_reader   :response
    validates_format_of :sender, :with => /^\d*$/, :if => Proc.new { !sender.nil? }
    validates_format_of :pagesize, :with => /^\d*$/, :if => Proc.new { !unixdate.nil? }
    validates_length_of :pagesize, :within => 1..4
    def initialize(args = {})
      super
      @ACTION_NAME = [:latestoutbox,@FORMAT].join('.').freeze
      @pagesize    = args.fetch(:pagesize,3000).ctsd 
      @sender      = args.fetch(:sender,nil)
      @response    = ResponseLatestOutBox.new
    end
  
    def call
        connection = Faraday.new(url: "#{@API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response @FORMAT.to_sym
        end
         response = connection.get(@ACTION_NAME, sender: @sender,pagesize: @pagesize)
         @response.validate(response.body)
    end
    
  end

end 
