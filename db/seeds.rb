

20.times do
  user = User.create!(
  username: Faker::Name.name,
  email:Faker::Internet.email,
  password:Faker::Internet.password(10)
  )
end

30.times do
  question = Question.create!(
  title:Faker::Name.title,
  body:Faker::Lorem.paragraph,
  user_id: User.all.sample.id
  )
end

30.times do
  answer= Answer.create!(
  body:Faker::Lorem.paragraph,
  user_id: User.all.sample.id,
  question_id: Question.all.sample.id
  )
end

  30.times do
    comment = Comment.create!(
    body:Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
    commentable_id:rand(1..30),
    commentable_type:["Question","Answer"].sample
    )
  end



  500.times do
    vote = Vote.create(
    points: [1, -1].sample,
    user: User.all.sample,
    # votable: (Comment.all + Question.all + Answer.all).sample
    votable_id: rand(1..30),
    votable_type:["Answer","Question","Comment"].sample
    )
  end
