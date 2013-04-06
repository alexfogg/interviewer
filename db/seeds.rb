Answer.delete_all
Question.delete_all
Interview.delete_all
Progress.delete_all
Tag.delete_all
User.delete_all

u1 = User.create(email: 'bob@gmail.com', name: 'bob', password: 'a', password_confirmation: 'a', image: 'http://i.imgur.com/ZCqfy3C.jpg', address: '200 park ave, ny', phone: '1234567890', balance: 500.00)
u2 = User.create(email: 'adi@gmail.com', name: 'adi', password: 'a', password_confirmation: 'a', image: 'http://i.imgur.com/ZCqfy3C.jpg', address: '100 park ave, ny', phone: '2234567890', balance: 300.00)
u3 = User.create(email: 'joe@gmail.com', name: 'joe', password: 'a', password_confirmation: 'a', image: 'http://i.imgur.com/ZCqfy3C.jpg', address: '300 park ave, ny', phone: '3234567890', balance: 200.00)

i1 = Interview.create(name: 'Basic Ruby', cost: 5.00, threshold: 50.00)
i2 = Interview.create(name: 'Advanced Ruby', cost: 10.00, threshold: 50.00)
i3 = Interview.create(name: 'Basic JS', cost: 5.00, threshold: 50.00)
i4 = Interview.create(name: 'Advanced JS', cost: 10.00, threshold: 50.00)

q1 = Question.create(question: 'What is an array?', category: 'Basic Ruby')
q2 = Question.create(question: 'What is an object?', category: 'Basic Ruby')
q3 = Question.create(question: 'What is an polymorphic relationship?', category: 'Advanced Ruby')
q4 = Question.create(question: 'What is an auth_token?', category: 'Advanced Ruby')
q5 = Question.create(question: 'What is DOM?', category: 'Basic JS')
q6 = Question.create(question: 'What is Coffeescript?', category: 'Basic JS')
q7 = Question.create(question: 'What is D3?', category: 'Advanced JS')
q8 = Question.create(question: 'What is Dancer JS?', category: 'Advanced JS')

a1 = Answer.create(response: 'array', is_correct: true)
a2 = Answer.create(response: 'not array', is_correct: false)
a3 = Answer.create(response: 'object', is_correct: true)
a4 = Answer.create(response: 'not object', is_correct: false)
a5 = Answer.create(response: 'polymorphic', is_correct: true)
a6 = Answer.create(response: 'not polymorphic', is_correct: false)
a7 = Answer.create(response: 'auth_token', is_correct: true)
a8 = Answer.create(response: 'not auth_token', is_correct: false)
a9 = Answer.create(response: 'DOM', is_correct: true)
a10 = Answer.create(response: 'not DOM', is_correct: false)
a11 = Answer.create(response: 'Coffeescript', is_correct: true)
a12 = Answer.create(response: 'not Coffeescript', is_correct: false)
a13 = Answer.create(response: 'D3', is_correct: true)
a14 = Answer.create(response: 'not D3', is_correct: false)
a15 = Answer.create(response: 'Dancer JS', is_correct: true)
a16 = Answer.create(response: 'not Dancer JS', is_correct: false)

p1 = Progress.create(num_right: 25, num_wrong: 67, percentage: 8.69)
p2 = Progress.create(num_right: 7, num_wrong: 34, percentage: 15.70)
p3 = Progress.create(num_right: 18, num_wrong: 93, percentage: 49.13)
p4 = Progress.create(num_right: 56, num_wrong: 15, percentage: 92.35)

t1 = Tag.create(name: 'Ruby')
t2 = Tag.create(name: 'JS')

i1.tags << t1
i2.tags << t1
i3.tags << t2
i4.tags << t2

# t1.interviews << i1 << i2
# t2.interviews << i3 << i4

i1.progresses << p1
i2.progresses << p2
i3.progresses << p3
i4.progresses << p4

u1.progresses << p1 << p2
u2.progresses << p3
u3.progresses << p4


i1.questions = [q1, q2]
i2.questions = [q3, q4]
i3.questions = [q5, q6]
i4.questions = [q7, q8]

q1.answers = [a1, a2]
q2.answers = [a3, a4]
q3.answers = [a5, a6]
q4.answers = [a7, a8]
q5.answers = [a9, a10]
q6.answers = [a11, a12]
q7.answers = [a13, a14]
q8.answers = [a15, a16]

u1.interviews << i1 << i4
u2.interviews << i2
u3.interviews << i3

u1.is_house = true

u1.save
u2.save
u3.save

t1.save
t2.save

i1.save
i2.save
i3.save
i4.save

q1.save
q2.save
q3.save
q4.save
q5.save
q6.save
q7.save
q8.save
