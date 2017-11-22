class TagTopic < ApplicationRecord
  validates :topic, presence: true

  has_many :tags,
  class_name: 'Tagging',
  primary_key: :id,
  foreign_key: :topic_id

  has_many :topical_urls,
  through: :tags,
  source: :tagged_urls

  def popular_links
    urls = []
    Tagging.where(topic_id: self.id).map(&:id).each do |url_id|
      url = ShortenedUrl.find_by(id: url_id)
      puts "Popular links for #{self.topic}:"
      puts "The original long url is: #{url.long_url}"
      puts "The unique code for this url is: #{url.short_url}"
      puts "This code has been visited #{url.num_clicks} times."
    end
  end
end
