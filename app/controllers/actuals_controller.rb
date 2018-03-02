class ActualsController < ApplicationController
  layout 'admin'
  def index
    @actuals = Actual.all
  end

  def show
      @pupils = Pupil.all
      @actual = Actual.all
      @pupilsInClass = Pupil.where(:id == :pupil_id)
  end

  def edit
    @actual = Actual.find(params[:id])
  end

  def update
  end

  def new
    @actual = []
    5.times do
      @actual << Actual.new
    end
    @p = Actual.joins(:pupil).where(:pupils => {:classroom => 1}, :actuals => {:date => Date.today})

  end

  def create
    date = params[:date]
    actuals = params[:actuals].values
    actuals.each do |a|
      Actual.create({
        date: date,
        pupil_id: a[:pupil_id],
        attendance: a[:attendance]
      })
    end
    redirect_back(fallback_location: classrooms_url)
  end


  def delete
  end

private

def actual_params
   params.require(:actual).permit(:attendance, :pupil_id, :date, :circumstances)
end

end
