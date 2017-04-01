module KaveRestApi
  
    API_URL = "https://api.kavenegar.com/v1/#{KaveRestApi.configuration.api_key rescue raise('Api key not setting in configuration class')}"
    DEFAULT_SENDER = KaveRestApi.configuration.default_sender.freeze rescue raise('Default sender not setting in configuration class-->config/initializers/kave_rest_api.rb')
    FORMAT= KaveRestApi.configuration.format rescue 'json'
    I18n.config.available_locales = :en

    def self.require_libs(lib_path,*libs)
      libs.each do |lib|
        require_relative "#{lib_path}/#{lib}"
      end
    end
    
end