class SessionsController < ApplicationController
  
  def new 
  end 
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # sign in user and redirect to the user's show page
      sign_in user
      redirect_to user
    else
      #create an error message and re-render the signin form
      #We'd think this would work OK, but notice that the error persists one extra request beyond this page : 
      # try submitting bad data and then clicking "home"
      # flash[:danger] = 'Invalid email/password combination'
      
      # flash.now will make sure that the flash only persists this once. 
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy 
  end
  
end
