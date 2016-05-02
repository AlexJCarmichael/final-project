class UsersController < Clearance::UsersController

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = user_from_params
    if @user.password == @user.password_confirmation
      if @user.save
        sign_in @user
        redirect_back_or url_after_create
      else
        flash[:alert] = 'Username, email, password, name, and confirm password required.'
        render template: "users/new"
      end
    else
      flash[:alert] = 'Passwords do not match'
      render template: "users/new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :name, :phone_number, :profile_pic)
  end
end
