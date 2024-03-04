class Availability < ApplicationRecord
  belongs_to :teacher
  belongs_to :admin_user, class_name: 'User'
end
