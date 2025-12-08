class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = policy_scope(User)
    authorize @users 

    render json: @users
  end

  # GET /users/1
  def show
    authorize @user
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
      UserMailer.welcome_email(@user).deliver_later
    else
      render json: @user.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_content
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    authorize @user
    @user.destroy!

    render json: {message: "User deleted successfully."}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :role_id )
    end
end
