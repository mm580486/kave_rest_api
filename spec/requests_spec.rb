require 'kave_rest_api'
require "spec_helper"

describe KaveRestApi do
  describe "#configure" do
    before do
        KaveRestApi.configure do |config|
        
        # To completely ignore debug mode events (not even unneccecery raise errors), uncomment this line *optional
        # config.debugmode = false #by default is true !!!
        
        # It is recommended you pull your API keys from environment settings. *required
        config.api_key = '50344E7950373944734C794861424A6E382F545234673D3D'
        
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
    
    
  end
end