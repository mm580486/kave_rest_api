
module KaveRestApi
    module NumberHelper
     def ctpd
         return self.to_s.tr('0123456789','۰١۲۳۴۵۶۷۸۹')
     end
     
    end
    
    module StringHelper
      
     def ctsd
         return self.to_s.tr('۰١۲۳۴۵۶۷۸۹،','0123456789,')
     end
     
     def ctpd
         return self.to_s.tr('0123456789,','۰١۲۳۴۵۶۷۸۹،')
     end
     
    end
    
end

class Integer
  include KaveRestApi::NumberHelper
end

class String
  include KaveRestApi::StringHelper
end