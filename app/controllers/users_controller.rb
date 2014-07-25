class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
  @user = User.create( user_params )
  @user.save
  end

   def edit
    @user = User.find(params[:id])
     render_forbidden and return unless can_edit?
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to @user
    end
  end

  private
  def can_edit?
    @user.role == 'admin' || current_user == @user
  end
    def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

end
