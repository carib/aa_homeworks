# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  answer_id  :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_id, presence: true
  validate :not_duplicate_response
  
  belongs_to :respondent,
  class_name: 'User',
  foreign_key: :user_id
  
  belongs_to :answer_choice,
  class_name: 'AnswerChoice',
  foreign_key: :answer_id
  
  has_one :question,
  through: :answer_choice,
  source: :question
  
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    self.sibling_responses.map(&:user_id).include?(respondent.id)
  end
  
  private
  def not_duplicate_response
    if respondent_already_answered?
      errors[:duplicate_response] << 'Can only respond to a question once'
  end
end