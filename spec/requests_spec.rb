require 'kave_rest_api'
require "spec_helper"

describe KaveRestApi do
  describe "#configure" do
    before do
        KaveRestApi.configure do |config|
        
        # To completely ignore debug mode events (not even unneccecery raise errors), uncomment this line *optional
        # config.debugmode = false #by default is true !!!
        
        # It is recommended you pull your API keys from environment settings. *required
        config.api_key = 'XXXX-XXXX-XXXX-XXXX-XXXX'
        
        # Default response format it can include json or xml , by default is json. *optional
        config.format  = 'json'
        
        # if you not setting sender like on send sms lookup or outher method gem use this number for default sender in requests *required
        config.default_sender  = '10000777070777'
        
        # this line help u on remove all emoji on string or find unuseful(like android emoji) and replace with standard emoji (https://www.webpagefx.com/tools/emoji-cheat-sheet/)
        # config.strip_emoji = false # default is false it can include false or true and matcher
        
      end
  
    end

    it "send a simple sms" do
        new=KaveRestApi::SendSimple.new({
            receptor: '09127105568',
            message: 'salam'
        })
        response=new.call
        expect(response.valid?).to eq(true)
    end
    
    it "strip emoji" do
      string = 'i\'m Rubyist🤠😎'
      expect(string.strip_emoji).to eq('i\'m Rubyist')
    end
    
    
    it "regex phone" do
        
        phone_number='09127105568'
        expect(phone_number.is_phone?).to eq(true)
        
        phone_number='۰۹۱۲۷۱۰۵۵۶۸'
        expect(phone_number.is_phone?).to eq(true)
    end
    
    it 'convert persian digit to standard digit' do
        phone_number='0۹1۲7۱0۵5۶8'
        expect(phone_number.ctsd).to eq('09127105568')
    end
    
    it 'check multibyte string' do
        string = 'Hi :)'
        expect(string.multibyte?).to eq(false)
        
        string = 'salam خوبی ؟'
        expect(string.multibyte?).to eq(true)
        
        string = 'hi 😈'
        expect(string.multibyte?).to eq(true)
    end
    
  end
end