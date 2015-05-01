
user = User.create(name: "Charles", password: "yolo")

5.times do
  question = user.questions.create(title: "This is a question?", content: "This is a questions content")
  2.times do
    answer = question.answers.create(content: "this is an answer", user_id: user.id, question_id: question.id, user_id: user.id)
    answer.responses.create(content: "this is a response", user_id: user.id)
    question.responses.create(content: "this is a response", user_id: user.id)
    question.tags.create(name: Faker::Hacker.adjective)
  end
end
