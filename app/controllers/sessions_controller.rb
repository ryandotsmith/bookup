class SessionsController < ApplicationController
  include Clearance::App::Controllers::SessionsController
private
      def url_after_create
        books_url
      end
end
