%w(faraday faraday_middleware validatable i18n).each do |dependency|
    require dependency
end


module KaveRestApi
    
  class << self
    attr_accessor :configuration
  end
  
  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :api_key, :default_sender,:debugmode,:format
    
    def initialize
    end
    
    
  end
  
end



%w(version core helper request meaning respond).each do |identify|
    require "kave_rest_api/#{identify}"
end




