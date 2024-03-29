class UsersController < ApplicationController
   def new
   		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url, :notice => "Signed up Successfully!"
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private

  	def user_params
  			params.require(:user).permit(:username, :email, :phone_number, :salt, :password, :encrypted_password)
  	end
end
