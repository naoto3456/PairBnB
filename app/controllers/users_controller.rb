class UsersController < Clearance::UsersController
	def dashboad
	end

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to '/'
    else
      
    end

  end

  private
	def user_params
    	params.require(:user).permit(:id, :email, :password, :first_name, :last_name, :gender,  :avatar, :remove_avata)
  end
  
end