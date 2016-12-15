get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.user_id = current_user.id

  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/new' do
 erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  binding.pry
  @answers = @question.answers
  erb :'questions/show'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])

  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

delete '/questions/:id' do
  @question= Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end
