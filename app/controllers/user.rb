get '/users/new' do
	if request.xhr?
		erb :'_new_user', layout: false
	else
		erb :'users/new'
	end
end

post '/users/new' do
	@user = User.new(params[:user])

	if @user.save
		session[:user_id] = @user.id
		redirect '/questions'
	else
		@errors=@user.errors.full_messages
		# note it`s plural, messages
	    erb :'users/new'
	end
end
