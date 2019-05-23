class UsersController < ApplicationController

  def index
      @user = User.all
    end

    def show
      @user = User.find(params[:id])
    end

  def new
      @user = User.new
  end

  def edit
      @user = User.find(params[:id])
  end

  def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user
      else
        render 'new'
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user: params[:user][:nivel])

  end

  private
      def user_params
      params.require(:user).permit(:id, :email, :encrypted_password, :nivel)
    end

end
