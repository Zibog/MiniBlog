class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    # User exists && password is valid
    if user && user.authenticate(params[:session][:password])
      # Log in and redirect to user page
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
  end
end
