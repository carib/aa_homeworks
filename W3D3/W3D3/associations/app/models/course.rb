class Course < ApplicationRecord
  has_many :enrollments,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: 'Enrollment'

  has_many :enrolled_students,
  through: :enrollments,
  source: :user

  belongs_to :instructor,
  class_name: 'User',
  primary_key: :id,
  foreign_key: :instructor_id
end
