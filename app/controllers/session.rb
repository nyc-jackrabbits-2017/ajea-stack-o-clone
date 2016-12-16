get '/sessions/login' do 

	erb :'sessions/login'
end

post '/sessions/login' do 

	@user = User.find_by_email(params[:email])

	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id 

		redirect '/questions'
	else

	  @errors = ["Error: email and password do not match"]

	  erb :'sessions/login'

	end 


end  

get '/sessions/logout' do 
  session.clear
  redirect '/questions'
end 