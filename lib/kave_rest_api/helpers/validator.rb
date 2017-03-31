
module KaveRestApi
    module NumberHelper
  
     def is_phone?
         return !!self.match(/^(09{1})+([1-3]{1})+(\d{8})$/)
     end
     
    end
    
    module StringHelper
        
     def multibyte?
       chars.count < bytes.count
     end 
      
     def is_phone?
         return !!self.ctsd.match(/^(09{1})+([1-3]{1})+(\d{8})$/)
     end
        
    end

end

class Integer
  include KaveRestApi::NumberHelper
end

class String
  include KaveRestApi::StringHelper
end