module SessionsHelper
  #OK, so here's our actual sign_in method, which our tests look for. 
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end
end
