class Teachers::AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher
  before_action :set_availability, only: %i[show edit update destroy]

  def index
    @availabilities = @teacher.availabilities
  end

  def show; end

  def new
    @availability = @teacher.availabilities.new
  end

  def create
    @availability = @teacher.availabilities.new(availability_params)

    if @availability.save
      redirect_to teacher_availabilities_path(@teacher), notice: 'Availability was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @availability.update(availability_params)
      redirect_to teacher_availabilities_path(@teacher), notice: 'Availability was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @availability.destroy
    redirect_to teacher_availabilities_path(@teacher), notice: 'Availability was successfully destroyed.'
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def set_availability
    @availability = @teacher.availabilities.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:start_time, :end_time, :date, :day_of_week)
  end
end
