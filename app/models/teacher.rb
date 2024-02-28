# app/models/teacher.rb
class Teacher < ApplicationRecord
  has_many :availabilities
  has_many :appointments

  # Additional attributes
  validates :name, presence: true
  validates :subject, presence: true
  validates :qualifications, presence: true
  validates :experience, presence: true
  validates :contact_information, presence: true
  validates :bio, presence: true

  # Additional attributes: name, subject, qualifications, experience, contact_information, bio
end
