class UsersController < ApplicationController
  def new
  end
  
  def show
    @user = User.find(params[:id])
  end 
  
  def new 
    @user = User.new
  end
  
  def create 
    #see http://stackoverflow.com/questions/19860257/ruby-on-rails-activemodelforbiddenattributeserror-in-commentscontrollercrea
    flash[:notice] = "Create method invoked."
    @user = User.new(params[:user].permit(:name, :email, :password, :password_confirmation))
    if @user.valid? 
      flash[:notice] = "User valid."
    else
      flash[:notice] = "User not valid."
    end
      
    if @user.save
      #Handle a successful save
      flash[:notice] = 'User saved!'
      redirect_to @user
    else
      flash[:notice] = 'User not saved!'
      render 'new'
    end
  end
  
  #see http://stackoverflow.com/questions/17335329/activemodelforbiddenattributeserror-when-creating-new-user
  # This has to do with the pessimistic / optimistic way that Rails now handles attribute accessibility. 
  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  
end
