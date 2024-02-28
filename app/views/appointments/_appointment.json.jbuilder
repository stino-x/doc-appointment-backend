json.extract! appointment, :id, :user_id, :teacher_id, :start_time, :end_time, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
