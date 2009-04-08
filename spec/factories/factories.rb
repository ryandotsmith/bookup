Factory.sequence :isbn do |n|
  isbn = "#{n}"
  9.times {|i| isbn <<"#{rand(10)}"} 
  isbn.to_i
end

Factory.define :book do |b|
  b.title         { "Introduction to Logic" }
  b.isbn          { '0131898345' }
  b.edition       { "12th" }
end

Factory.define :listing do |l|
  l.association :book, :factory => :book
  l.association :user, :factory => :user
  l.market_status 1
  l.price 0.01
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
