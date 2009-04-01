Factory.define :book do |f|
  f.title "Introduction to Logic"
  f.isbn "12345678910"
  f.description "This book is tip top shape"
  f.association :user, :factory => :user 
end