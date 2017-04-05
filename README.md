# KaveRestApi


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kave_rest_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kave_rest_api
    
    
## How do I configure my app for Kave negar service ?

###### Using the generator

Run the generator :
    ```rails generate kave_rest_api install```

This will create a initializer at **`config/initializer/kave_rest_api_initializer.rb`**.
You can set api key , default sender , strip emoji , debugmode or format

```ruby
KaveRestApi.configure do |config|
    
  # To completely ignore debug mode events(No Errors) uncomment this line *optional
  # config.debugmode = false #by default it's true
  
  # It is recommended that you pull your API keys from environment settings. *required
  config.api_key = 'XXXX-XXXX-XXXX-XXXX'
  
  # Default response format is json (you can use xml too). *optional
  config.format  = 'json'
  
  #If you don't set your sender number in your request, this is the default number used instead *required
  config.default_sender  = 'XXXXXXXXXXXX'
  
  # You can remove problematic emojis (like android emojis) and replace with standard emojis listed here:(https://www.webpagefx.com/tools/emoji-cheat-sheet/)
  # config.strip_emoji = 'false' # can include false , true and matcher
  
end
```

## Send Simple SMS
```ruby

client=KaveRestApi::SendSimple.new({
        receptor: '09127105568', # can be array ['09127105568','09123456789'] < = 3000 
        message: 'hello my freinds'
        #optional arguments
        # ,sender: 'XXXXXXXXX'
        # ,date: (Date.today + 90)
        # ,type: 0 read this table http://kavenegar.com/rest.html#result-msgmode
        # ,localid: SomeModel.id
})

if client.valid?
    response = client.call
else
    flash[:error]=client.errors.full_messages # is array
    .
    .
end

if response.valid?
    # anything ....
else
    response.full_message_errors # is string 
end

```
notice: you can use persian and arabic number in receptor.

## Receive SMS

```ruby
client= KaveRestApi::Receive.new({
    #optional arguments
    linenumber: 'XXXX-XXXX-XXXX-XXXX',
    isread: 0 # unread sms = 0 and read sms = 1
})

if client.valid?
    response = client.call
else
    flash[:error]=client.errors.full_messages # is array
    .
    .
end

if response.valid?
    inbox=response.entries
else
    response.full_message_errors # is string 
end

inbox = > [
        {
            "messageid" : 35850015 , 
            "message" : "خدمات پیام کوتاه کاوه نگار" , 
            "sender" : "09360462960" ,
            "receptor" : "3000202030" ,
            "date" : 1357206241 
        },
        {
            "messageid" : 35850016 , 
            "message" : "خدمات پیام کوتاه کاوه نگار" , 
            "sender" : "09123832441" ,
            "receptor" : "3000202030" ,
            "date" : 1357103281 
        }
    ]



```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mm580486/kave_rest_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

