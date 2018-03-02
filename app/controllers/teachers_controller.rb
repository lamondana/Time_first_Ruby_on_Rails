class TeachersController < ApplicationController

layout 'admin'

  def index
    @teachers = Teacher.all
    @teachersRobin = @teachers.where(:classroom_id => 2)
    @teachersRobin = @teachers.where(:classroom_id => 2)
    @teachersRobin = @teachers.where(:classroom_id => 2)
  end

  def show
    @teacher = Teacher.find(params[:id])
    @id = @teacher.classroom_id
    @classroom = Classroom.find(@id).classroom_name
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = "Teacher created successfully."
      redirect_to(teachers_path)
    else
      render("new")
    end

  end

  def delete
    @teacher = Teacher.find(params[:id])
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    if @teacher.destroy
      flash[:notice] = "Teacher #{@teacher.first_name} destroyed successfully."
      redirect_to(teachers_path)
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
  if @teacher.update_attributes(teacher_params)
    flash[:notice] = "Teacher updated successfully."
    redirect_to(teacher_path(@teacher))
  else
    render("edit")
  end
  end

  private

  def teacher_params
     params.require(:teacher).permit(:first_name, :last_name, :username, :password, :classroom_id)
  end

end
