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
    rails generate kave_rest_api install

This will create a initializer at config/initializer/kave_rest_api_initializer.rb.
You can set api key , default sender , strip emoji , debugmode or format

```

KaveRestApi.configure do |config|
    
  # To completely ignore debug mode events(No Errors) uncomment this line *optional
  # config.debugmode = false #by default it's true
  
  # It is recommended that you pull your API keys from environment settings. *required
  config.api_key = 'XXXX-XXXX-XXXX-XXXX'
  
  # Default response format is json (you can use xml too). *optional
  config.format  = 'json'
  
  #If you don't set your sender number in your request, this is the default number used instead *required
  config.default_sender  = '10000777070777'
  
  # You can remove problematic emojis (like android emojis) and replace with standard emojis listed here:(https://www.webpagefx.com/tools/emoji-cheat-sheet/)
  # config.strip_emoji = false # can include false , true and matcher
  
end



```





    

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/kave_rest_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

