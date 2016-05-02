class UsersController < Clearance::UsersController

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params
    if @user.password == user.password_confirmation
      if @user.save
        sign_in @user
        redirect_back_or url_after_create
      else
        render template: "users/new"
      end
    else
      render template: "users/new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :name, :phone_number, :profile_pic)
  end
end
