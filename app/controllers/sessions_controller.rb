class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) # use new ruby operator
      log_in user
      redirect_to home_url
    else
      flash.now[:danger] = t('sessions.create.email_error')
      render 'new'
    end
  end

  def new
    if logged_in?
      redirect_to :root
    end
  end

def destroy
  log_out
  redirect_to root_url
 end
end
