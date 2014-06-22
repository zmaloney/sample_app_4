module SessionsHelper
  
  #So lets define a persistent getter / setter. 
  # First, the setter: 
  def current_user=(user) #YUSS it's this syntax! It allows us to do "current_user = <object>"
    @current_user = user
  end
  
  #And now the getter: 
  def current_user 
    #If we just returned @current_user here, then we'd be replicating the functionality of attr_accessor, 
    # but we don't want to do that, since attr_accessor does it as a local-style attribute
    # and the way we'll do it here says "if it's nothing, get it from the db"
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) #THIS SYNTAX TOO.
  end 
  
  #OK, so here's our actual sign_in method, which our tests look for. 
  def sign_in(user)
    #so, Rails gives us this "cookies" utility for free. 
    # The "permanent" cookie really isn't; it expires 20 years from now (20.years.from_now)
    # NB also that 'cookies' really isn't a hash, since assigning to 'cookies' saves a piece of text on the browser
    cookies.permanent[:remember_token] = user.remember_token
    #This line creates current_user, which is accessible in both controllers and views. 
    # I'm not sure at which point in the lifecycle it becomes available, but the 'self' reference makes 
    # it globally available, rather than a session variable. 
    self.current_user = user
  end
  
  # and a simple boolean which allows us to find out if we're signed in. 
  def signed_in? 
    !current_user.nil?
  end
  
  #Of course, if we can sign in, we should be able to sign out. 
  def sign_out
    self.current_user = nil 
    cookies.delete(:remember_token)
  end
  
end
