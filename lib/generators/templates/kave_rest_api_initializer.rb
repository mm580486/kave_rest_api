KaveRestApi.configure do |config|
    
  # To completely ignore debug mode events(No Errors) uncomment this line *optional
  # config.debugmode = false #by default it's true
  
  # It is recommended that you pull your API keys from environment settings. *required
  config.api_key = '50344E7950373944734C794861424A6E382F545234673D3D'
  
  # Default response format is json (you can use xml too). *optional
  config.format  = 'json'
  
  #If you don't set your sender number in your request, this is the default number used instead *required
  config.default_sender  = '10000777070777'
  
  # You can remove problematic emojis (like android emojis) and replace with standard emojis listed here:(https://www.webpagefx.com/tools/emoji-cheat-sheet/)
  # config.strip_emoji = false # can include false , true and matcher
  
end
