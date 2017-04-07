require 'kave_rest_api'
require_relative 'config'


puts 'hello my freind, can i help you ? (-h)'

while input = gets.chomp()
puts 'allright please wait...'
case input
when 'help','-h'
   puts '-q[quite]		break while'
   puts '-i[inbox]		show inbox messages'
   puts '-s[send_simple]		send simple sms'

when 'quite','-q'
	puts 'Ok , bye'
break
when 'inbox','-i'
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

when 'send_simple','-s'
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
puts 'can i help you ? (-h)'
end