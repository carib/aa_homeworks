# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer          not null
#

class Question < ApplicationRecord
  validates :text, :poll_id, presence: true
  
  belongs_to :poll,
  class_name: 'Poll',
  foreign_key: :poll_id
  
  has_many :answer_choices,
  class_name: 'AnswerChoice',
  foreign_key: :question_id
  
  has_many :responses,
  through: :answer_choices,
  source: :responses
end
