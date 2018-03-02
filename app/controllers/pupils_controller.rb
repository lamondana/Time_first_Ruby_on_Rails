class PupilsController < ApplicationController

layout 'admin'
  def index
    @pupils = Pupil.sorted
  end

  def show
    @pupil = Pupil.find(params[:id])
  end

  def new
    @pupil = Pupil.new
    @classrooms = Classroom.all
  end

  def create
    @pupil = Pupil.new(pupil_params)
    if @pupil.save
      flash[:notice] = "Pupil created successfully."
      redirect_to(pupils_path)
    else
      render("new")
    end
end
  def edit
      @pupil = Pupil.find(params[:id])

  end

  def update
    @pupil = Pupil.find(params[:id])
  if @pupil.update_attributes(pupil_params)
    flash[:notice] = "Pupil updated successfully."
    redirect_to(pupil_path(@pupil))
  else
    render("edit")
  end
end


  def delete
    @pupil = Pupil.find(params[:id])
    @pupil.destroy
  end

  def destroy
    @pupil = Pupil.find(params[:id])
    if @pupil.destroy
      flash[:notice] = "Pupil  #{@pupil.first_name} destroyed successfully."
      redirect_to(pupils_path)
    end
  end

  private
 def pupil_params
   params.require(:pupil).permit(:first_name, :last_name, :classroom_id, :is_active, :monday, :tuesday, :wednesday, :thursday, :friday)
 end
end
