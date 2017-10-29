class Api::V1::UsersController < ApiController
  before_action :authenticate_user, only: [:show]

  def show
    render json: current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.registration_confirmation(user).deliver_now
      render json: {}, status: 200
    else
      render json: user.errors, status: 422
    end
  end

  def confirm_email
    user = User.find_by(confirm_token: params[:id])
    if user
      user.email_activate!
      render json: {}, status: 200
    else
      render json: {errors: ['Confirmation token invalid']}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :nickname, :password, :password_confirmation)
  end
end
