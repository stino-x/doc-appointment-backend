class Teacher < ApplicationRecord
  belongs_to :admin_user, class_name: 'User'
  has_many :appointments
  has_many :availabilities, dependent: :destroy # Add this line

  after_initialize :update_active_status

  private

  def update_active_status
    # Check if the teacher has any appointments for today at the current time
    self.active = !appointments.where('start_time <= ? AND end_time >= ? AND date = ?', Time.current, Time.current,
                                      Date.today).exists?
  end
end
