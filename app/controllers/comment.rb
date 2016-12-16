get '/comments' do
  @comments = Comment.all
  erb :'/comments/index'
end

get '/questions/:question_id/comments/new' do
  @comment_type = Question.find(params[:question_id])
  erb :'/comments/new'
end

get '/answers/:answer_id/comments/new' do
  @comment_type = Answer.find(params[:answer_id])
  erb :'/comments/new'
end

post '/answers/:id/comments' do
  answer = Answer.find(params[:id])
  @comment = Comment.new(body: params[:comment], user_id: "#{answer.user_id}", commentable_type: "#{answer.class}", commentable_id: "#{answer.id}" )

  if @comment.save
    redirect "/questions/#{answer.question_id}"
  else
    @errors = @comment.errors.full_messages
    erb :"/answers/#{answer.id}/comments/new"
  end
end

post '/questions/:id/comments' do
  question = Question.find(params[:id])
  @comment = Comment.new(body: params[:comment], user_id: "#{question.user_id}", commentable_type: "#{question.class}", commentable_id: "#{question.id}" )

  if @comment.save
    redirect "/questions/#{question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :"/comments/new"
  end
end
