class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  # GET /appointments
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  def show
    # Show appointment details
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /appointments/1/edit
  def edit
    # Edit appointment details
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  # GET /users/:user_id/appointments
  def index_for_user
    @user = User.find(params[:user_id])
    @appointments = @user.appointments
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :status, :user_id, :teacher_id)
  end
end
