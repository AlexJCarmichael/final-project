class UsersController < Clearance::UsersController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params.fetch(:id))
    @sessions = @user.my_games
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:alert] = "Updated sucsessfully"
      redirect_to "/about/"
    else
      flash[:alert] = "Couldn't update"
    end
  end

  def friendship
    @friend = Friend.new(to_user_id: params[:to_user_id], status: "pending")
    @friend.user = current_user
    if @friend.save
      redirect_to :back
    else
      flash[:alert] = "Couldn't initiate friendship"
      redirect_to :back
    end
  end

  def player
    @player = Player.new(player_params)
    if @player.save
      redirect_to :back
    else
      flash[:alert] = "Couldn't invite player"
    end
  end

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    if @user.password == params[:user][:password_confirmation]
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

  def acceptance
    friend = Friend.find_by("user_id = ? and to_user_id = ?", params[:from], params[:to])
    friend.status = Friend::ACCEPTED
    friend.save
    redirect_to :back
  end

  def denial
    friend = Friend.find_by("user_id = ? and to_user_id = ?", params[:from], params[:to])
    friend.status = Friend::DECLINED
    friend.save
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :name, :phone_number, :profile_image)
  end

  def player_params
    params.require(:player).permit(:user_id, :game_session_id)
  end
end
