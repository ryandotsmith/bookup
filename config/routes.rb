ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'books', :action => 'index'
  map.resources :users, :has_one  => [:password, :confirmation],
                        :has_many => [:listings]
  map.resource :session
  map.resources :passwords
  map.resources :books, :has_many => [:listings]
  map.lookup '/books/lookup',
    :controller =>  'books',
    :action     =>  'lookup'
end
