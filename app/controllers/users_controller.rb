class UsersController < Clearance::UsersController
	def dashboad
	end

  # def create
  #   @user = user_from_params
  #   byebug
  #   if @user.save
  #     sign_in @user
  #     redirect_back_or url_after_create
  #   else
  #     render template: "users/new"
  #   end
  # end

	def user_params
    	params.require(:user).permit(:email, :password, :first_name, :last_name, :gender)
  	end
end