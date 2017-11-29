# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w[PENDING APPROVED DENIED],
    message: 'Invalid status'}


  belongs_to :cat,
  class_name: 'Cat',
  foreign_key: :cat_id,
  dependent: :destroy

  def overlapping_requests
    CatRentalRequest.select('*')
      .where.not(id: self.id)
      .where('end_date > ? AND start_date < ?', self.start_date, self.end_date)
  end

  def overlapping_approved_requests
    oreq = overlapping_requests
    oreq.select("*")
      .where("status = 'APPROVED'")
  end

  private
end
