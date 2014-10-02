class SessionsController < ApplicationController
  def login
    #Login Form
  end
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to(:action => 'profile')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"  
    end
  end

  	def create
  		user = User.authenticate(params[:email], params[:password])
  		if user
    		session[:user_id] = user.id
    		redirect_to root_url, :notice => "Logged in!"
  		else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
	end

	def destroy
  		session[:user_id] = nil
  		redirect_to root_url, :notice => "Logged out!"
  	end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'root_url'
  end
end