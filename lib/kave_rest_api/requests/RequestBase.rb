module KaveRestApi
  class RequestBase
      def initialize(args = {})
          config = KaveRestApi.configuration
          @API_URL = "https://api.kavenegar.com/v1/#{config.api_key}"
          @DEFAULT_SENDER = config.default_sender.freeze
          @FORMAT= config.format rescue 'json'
      end
  end
end