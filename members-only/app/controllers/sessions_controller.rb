class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Congratulations! Log in successful!'
      redirect_to posts_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    @current_user = nil
    cookies.delete(:remember_token)
    redirect_to root_url
  end

end
