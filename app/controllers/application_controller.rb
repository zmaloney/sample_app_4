class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #include the sessions helper module, since by default all the helpers are available in 
  # the views but not the controllers. This is a quick-and-dirty way of doing it. 
  include SessionsHelper 
end