class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, :user_id, presence: true

  belongs_to :submitter,
  class_name: 'User',
  primary_key: :id,
  foreign_key: :user_id

  has_many :visits,
  class_name: 'Visit',
  primary_key: :id,
  foreign_key: :url_id

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  has_many :tags,
  class_name: 'Tagging',
  primary_key: :id,
  foreign_key: :url_id

  has_many :tagged_topics,
  through: :tags,
  source: :tag_topics

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end

    return code
  end

  def self.create_short_url(long_url, user_id)
    shortened_url = self.random_code
    ShortenedUrl.create!(short_url: shortened_url, long_url: long_url, user_id: user_id)
    return shortened_url
  end

  def self.long_url_for_short_url(short_url)
    ShortenedUrl.find_by(short_url: short_url).long_url
  end

  def num_clicks
    # Count number of times the url_id shows up in visits
    Visit.where(url_id: self.id).count(:url_id)
  end

  def num_uniques
    # 'Distinct-ified'
    self.visitors
  end

  def num_recent_uniques
    # Same thing as num_uniques but is going to restraint it to the last 10 mins
    Visit.where(["url_id = ? AND updated_at >= ?", "#{self.id}", "#{10.minutes.ago}"]).distinct.count(:user_id)
  end

end
