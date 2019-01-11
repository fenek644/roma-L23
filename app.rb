require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
  end

get '/contacts' do
	erb :contacts
end


post '/visit' do
  @user_name = params[:username]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @master = params[:master]

  @title = "Thank you!"
  @message = "Dear #{@user_name}, we'll waiting for you  #{@date_time}"

  f = File.open './public/user.txt', 'a'
  f.puts "User: #{@user_name}, Phone: #{@phone}, Date and Time: #{@date_time} . Ваш мастер - #{@master}. "
  f.close

  erb :visit
end

post '/contacts' do
  @email = params[:email]
  @message = params[:message]

  # @title = "Thank you!"
  # @message = "Dear #{@user_name}, we'll waiting for you  #{@date_time}"

  f = File.open './public/contacts.txt', 'a'
  f.puts "email: #{@email}, Сообщение: #{@message}. "
  f.close

  erb :contacts
end

=begin


post '/admin' do
	@login = params[:aaa]
	@password = params[:bbb]

	if @login == 'admin' && @password == 'secret'
		@message_a = ""
		@t = []
		fil = File.open("user.txt","r")
		while (line = fil.gets)
			@t << line
		end
		fil.close
		erb :admin_info

	elsif @login == 'admin'
		@message_a = "You admin but password not right"
		erb :admin
	else
		@message_a = "Login ore password not correct."
		erb :admin
	end
end
=end
