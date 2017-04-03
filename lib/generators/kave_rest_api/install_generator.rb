module Mellat
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates KaveRestApi initializer for your application"

      def copy_initializer
        template "kave_rest_api_initializer.rb", "config/initializers/kave_rest_api.rb"
        
         puts <<~EOF
        \e[36mInstall complete 👻 \e[0m
          For report issues or suggest feature contact me on twitter/github: \e[32m@mm580486\e[0m 
         EOF
      end

    end
  end
end