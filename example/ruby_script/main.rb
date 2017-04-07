require 'kave_rest_api'
require_relative 'config'


puts 'hello my freind, can i help you ? (send_simple inbox)'
input = gets.chomp()

puts 'allright please wait...'

case input
when 'inbox'
    res=KaveRestApi::Receive.new({}).call
    raise("response is not valid because: #{res.full_message_errors}") unless res.valid?
    if res.entries.nil?
    	puts 'inbox is empty'
    else
		res.entries.each do |message|
			puts '*' * 80
			puts "from: #{message['sender']}"
			puts "to: #{message['receptor']}"
			puts "message: #{message['message']}"
			puts "on: #{Time.at(message['date'])}"
			puts '*' * 80
		end
    end

when 'send_simple'
	print 'Please enter receptor phone: '
	receptor = gets.chomp()
	print 'Please enter message: '
	message = gets.chomp()
	res=KaveRestApi::SendSimple.new({receptor: receptor,message: message}).call
	if res.valid?
		puts 'deliverd'
	else
		puts 'request is not valid , because: ' + res.full_message_errors
	end

end