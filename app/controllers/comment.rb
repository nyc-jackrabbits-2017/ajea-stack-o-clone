get '/comments' do
  @comments = Comment.all
  erb :'/comments/index'
end

get '/questions/:question_id/comments/new' do
  erb :'/comments/new'
end

get '/answers/:id/comments/new' do
  @comment_type = Answer.find(params[:id])
  erb :'/comments/new'
end

post '/answers/:id/comments' do
  answer = Answer.new(body: params[:body], user_id: "")
end
