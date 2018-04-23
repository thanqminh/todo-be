class UsersController < ApiController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def profile
    render :json => current_user
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.json {
          render json: {
            status: 'success',
            data:   current_user
          },
          status: :ok
        }
      else
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nick_name,:name,:image)
  end
end
