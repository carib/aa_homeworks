class User < ApplicationRecord
  validates :email, presence: true

  has_many :submitted_urls,
  class_name: 'ShortenedUrl',
  primary_key: :id,
  foreign_key: :user_id

  has_many :visits,
  class_name: 'Visit',
  primary_key: :id,
  foreign_key: :user_id

  has_many :visited_urls,
  -> { distinct },
  through: :visits,
  source: :shortened_url
  # class_name: 'Visit',
  # primary_key: :id,
  # foreign_key: :user_id

  def shorten_url(long_url)
    ShortenedUrl.create_short_url(long_url, self.id)
  end
end
