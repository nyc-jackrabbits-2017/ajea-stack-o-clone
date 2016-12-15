# WE DONT NEED THIS
get '/answers' do
  @answers = Answer.all
  erb :'answers/index'
end

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  question = Question.find(params[:question_id])
  @answer = Answer.new(body: params[:answer], question_id: "#{question.id}", user_id: "#{question.user_id}")

  if @answer.save
    redirect "/questions/#{question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :"/questions/#{question.id}/answers/new"
  end
end
