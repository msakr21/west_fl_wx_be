class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    # Create the user from params
    @user = User.new(user_params)
    return unless @user.save

    # Deliver the alerts email
    alerts = NwsFacade.escambia_alerts
    tweets = [TwitterFacade.fl511_alerts, TwitterFacade.bereadyescambia_alerts]
    UserNotifierMailer.send_alerts(@user, alerts, tweets).deliver_now
    redirect_to(@user, notice: 'User created')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
