post '/questions/:id/voteUp' do
  question = Question.find(params[:id])
  question.votes.create(points: 1, user_id: current_user.id)
  if request.xhr? && current_user
    content_type :json
    { id: question.id, votes: question.vote_value }.to_json
  else
    redirect "/questions"
  end
end

post '/questions/:id/voteDown' do
  question = Question.find(params[:id])
  question.votes.create(points: -1, user_id: current_user.id)
  if request.xhr? && current_user
    content_type :json
    { id: question.id, votes: question.vote_value }.to_json
  elsif request.xhr?
    @error = question.votes.errors.full_messages
  else
    redirect "/questions"
  end
end


post '/answers/:id/voteUp' do
  answer = Answer.find(params[:id])
  answer.votes.create(points: 1, user_id: current_user.id)
  if request.xhr? && current_user
    content_type :json
    { id: answer.id, votes: answer.vote_value }.to_json
  else
    redirect "/questions"
  end
end

post '/answers/:id/voteDown' do
  answer = Answer.find(params[:id])
  answer.votes.create(points: -1, user_id: current_user.id)
  if request.xhr? && current_user
    content_type :json
    { id: answer.id, votes: answer.vote_value }.to_json
  elsif request.xhr?
    @error = question.votes.errors.full_messages
  else
    redirect "/questions"
  end
end
