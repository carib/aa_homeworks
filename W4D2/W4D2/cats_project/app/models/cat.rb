# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = %w[black white red orange blue pink gray salmon].freeze
  validates :color, inclusion: { in: COLORS,
    message: "Please choose a valid color: #{COLORS}" }
  validates :sex, inclusion: { in: %w[M F],
    message: "Invalid input. Select M or F" }

    has_many :cat_rental_requests,
    class_name: 'CatRentalRequest',
    foreign_key: :cat_id


  def self.colors
    COLORS
  end



  private
  def age
    birth = self.birth_date
    now = Time.now.to_date
    (now - birth) / 365
  end

end
