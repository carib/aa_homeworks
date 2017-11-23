# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#

class AnswerChoice < ApplicationRecord
  validates :text, :question_id, presence: true
  belongs_to :question,
  class_name: 'Question',
  foreign_key: :question_id
  
  has_many :responses,
  class_name: 'Response',
  foreign_key: :answer_id
end
