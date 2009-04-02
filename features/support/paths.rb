module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the homepage/i
      root_path
    when /the sign up page/i
      new_user_path
    when /the sign in page/i
      new_session_path
    when /the password reset request page/i
      new_password_path
    when /books index page/
      books_path
    when /show book page/
      book_path
    when /add new book/
      new_book_path
    when /add new listing page/
      new_book_listing_path
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end
 
World do |world|
  world.extend NavigationHelpers
  world
end