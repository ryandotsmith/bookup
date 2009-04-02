Factory.define :book do |b|
  b.title "Introduction to Logic"
  b.isbn "12345678910"
  b.description "This book is tip top shape"
end

Factory.define :listing do |l|
  l.association :book, :factory => :book
  l.association :user, :factory => :user
  l.market_status '1'
end

Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.email                  { Factory.next :email }
  user.password               { "password" }
  user.password_confirmation  { "password" }
  user.name                   { "James Brown" }
end

Factory.define :email_confirmed_user, :class => 'user' do |user|
  user.email                  { Factory.next :email }
  user.password               { "password" }
  user.password_confirmation  { "password" }
  user.email_confirmed        { true }
  user.name                   { "James Brown" }
end
