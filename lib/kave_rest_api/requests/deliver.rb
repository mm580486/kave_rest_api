module KaveRestApi
  class Deliver
    ACTION_NAME    = [:status,FORMAT].join('.').freeze
    include Validatable
    attr_accessor :messageid
    attr_reader   :response
    validates_presence_of :messageid
    validates_format_of :messageid, :with => /^\d*$/, :if => Proc.new { !messageid.nil? }

    def initialize(args = {})
      @messageid    = args.fetch(:messageid)
      if @messageid.kind_of?(Array)
        raise(ArgumentError,'Message Id Arrays: Buffer Overflow: Max length 3000 of array') if @messageid.length > 3000
        @messageid    = @messageid.join(',') 
      end
      @messageid    = @messageid.ctsd
      @response     = ResponseDeliver.new
    end
  
    def call
        connection = Faraday.new(url: "#{API_URL}/sms/") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response FORMAT.to_sym
        end
         response = connection.get(ACTION_NAME, messageid: @messageid)
         @response.validate(response.body)
    end
    
  end

end 
