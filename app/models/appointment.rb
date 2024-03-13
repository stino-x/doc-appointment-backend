class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validate :appointment_time_within_availability
  validate :appointment_date_is_valid
  validate :availability_capacity_limit

  private

  def appointment_time_within_availability
    unless teacher_availabilities.exists? do |availability|
      availability.start_time <= start_time && # should change <= to == since its a class in the frontend
      availability.end_time >= end_time && # should change >= to == since its a class in the frontend
      availability.date == date # Compare date attribute with start_time's date
    end
      errors.add(:base, "Appointment time must fall within teacher's availability")
    end
  end

  def teacher_availabilities
    teacher.availabilities
  end

  def appointment_date_is_valid
    return unless date.present? && date <= Date.tomorrow

    errors.add(:date, 'must be at least one day ahead of the current date')
  end

  def availability_capacity_limit
    return unless teacher.present? && availability.present? && availability.appointments.count >= availability.capacity

    errors.add(:base, 'Appointment capacity for this availability has been reached')
  end

  def availability
    teacher.availabilities.find_by(date:) if teacher.present? && date.present?
  end
end
