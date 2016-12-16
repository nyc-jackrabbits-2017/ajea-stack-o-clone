get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  question = Question.find(params[:question_id])
  @answer = Answer.new(body: params[:answer][:body], question_id: "#{question.id}", user_id: "#{question.user_id}")

  if @answer.save
    redirect "/questions/#{question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :"/answers/new"
  end
end

get '/answers/:answer_id/edit' do
   @answer = Answer.find(params[:answer_id])
   @question = @answer.question

  if current_user
    erb :'answers/edit'
  else
    redirect "/questions/#{@question.id}"
  end
end

delete '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @question = @answer.question
  @answer.destroy
  redirect "/questions/#{@question.id}"
end
