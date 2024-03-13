class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show edit update destroy]
  before_action :require_admin, only: %i[new create edit update destroy]
  def index
    @teachers = Teacher.includes(:availabilities).all
  end
  def show
    @teacher = Teacher.includes(:availabilities).find(params[:id])
  end
  def new
    @teacher = Teacher.new
  end
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end
  def edit
    # Edit teacher details
  end
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end
  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
  def teacher_params
    params.require(:teacher).permit(:name, :subject, :qualifications, :experience, :contact_information, :bio,
                                    :admin_user_id)
  end
  def require_admin
    return if current_user.admin?
    flash[:alert] = 'You must be an admin to perform this action.'
    redirect_to root_path
  end
end