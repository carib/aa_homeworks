# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  live       :boolean          default(FALSE)
#  band_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, presence: true
  
  belongs_to :band
  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id,
    dependent: :destroy
end
