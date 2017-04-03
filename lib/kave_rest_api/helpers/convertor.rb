
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
     
     def strip_emoji
        str = self.force_encoding('utf-8').encode
		arr_regex=[/[\u{1f600}-\u{1f64f}]/,/[\u{2702}-\u{27b0}]/,/[\u{1f680}-\u{1f6ff}]/,/[\u{24C2}-\u{1F251}]/,/[\u{1f300}-\u{1f5ff}]/]
		arr_regex.each do |regex|
			str = str.gsub regex, ''
		end
		return str
     end
     
    end
    
end

class Integer
  include KaveRestApi::NumberHelper
end

class String
  include KaveRestApi::StringHelper
end