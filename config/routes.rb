ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'books', :action => 'home'
  map.resources :users, :has_one  => [:password, :confirmation],
                        :has_many => [:listings]
  map.resource :session
  map.resources :passwords

  map.autocomplete_tag_list '/books/autocomplete_tag_list',
    :controller =>  'books',
    :action     =>  'autocomplete_tag_list'
  map.resources :books, :has_many => [:listings]

  map.lookup '/books/lookup',
    :controller =>  'books',
    :action     =>  'lookup'
  map.home '/home',
    :controller =>  'books',
    :action     =>  'home'    
end
