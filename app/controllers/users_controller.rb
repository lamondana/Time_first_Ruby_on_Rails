class UsersController < ApplicationController
layout 'admin'
  def index
    @users = User.all
    @teachers = User.where(:role => "teacher")
  end

  def show
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
  end

  def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = "User  #{@user.first_name} destroyed successfully."
        redirect_to(users_path)
      end
  end

  def new
    @user = User.new
    @teacher = Teacher.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully."
      redirect_to(users_path)
    else
      render("new")
    end
  end


  def edit
  end

  private
def user_params
params.require(:user).permit(:first_name, :last_name, :classroom, :is_active, :password, :username, :role, :pupil_)
end


end
