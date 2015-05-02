
<<<<<<< HEAD
user1 = User.create(name: "mrpants", password: "yolo")
user2 = User.create(name: "Charles", password: "yolo")
=======
user = User.create(name: "Charles", password: "yolo")

>>>>>>> master
5.times do
  question = user1.questions.create(title: Faker::Hacker.say_something_smart, content: Faker::Lorem.paragraph(2))
  2.times do
<<<<<<< HEAD
    answer = question.answers.create(content: Faker::Hacker.say_something_smart, user_id: user2.id, question_id: question.id)
    answer.responses.create(content: Faker::Hacker.say_something_smart, user_id: user1.id)
    question.responses.create(content: Faker::Hacker.say_something_smart, user_id: user2.id)
=======
    answer = question.answers.create(content: "this is an answer", user_id: user.id, question_id: question.id, user_id: user.id)
    answer.responses.create(content: "this is a response", user_id: user.id)
    question.responses.create(content: "this is a response", user_id: user.id)
    question.tags.create(name: Faker::Hacker.adjective)
>>>>>>> master
  end
end
