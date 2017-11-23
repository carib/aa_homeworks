# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

class Poll < ApplicationRecord
  validates :title, presence: true, uniqueness: true 
  belongs_to :user,
  class_name: 'User',
  foreign_key: :user_id
  
  has_many :questions,
  class_name: 'Question',
  foreign_key: :poll_id
end
