module KaveRestApi
    
  
    I18n.config.available_locales = :en

    def self.require_libs(lib_path,*libs)
      libs.each do |lib|
        require_relative "#{lib_path}/#{lib}"
      end
    end
    
end