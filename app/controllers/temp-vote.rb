post '/questions/:id/voteUp' do
  question = Question.find(params[:id])
  question.votes.create(points: 1, user_id: current_user.id)
  if request.xhr?
    content_type :json
    { id: question.id, votes: question.vote_value }.to_json
  else
    redirect "/questions"
  end
end

post '/questions/:id/voteDown' do
  question = Question.find(params[:id])
  question.votes.create((points: -1, user_id: current_user.id)
  if request.xhr?
    content_type :json
    { id: question.id, votes: question.vote_value }.to_json
  else
    redirect "/questions"
  end
end
