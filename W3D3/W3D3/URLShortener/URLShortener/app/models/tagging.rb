class Tagging  < ApplicationRecord
  validates :topic_id, :url_id, presence: true

  belongs_to :tag_topics,
  class_name: 'TagTopic',
  primary_key: :id,
  foreign_key: :topic_id

  belongs_to :tagged_urls,
  class_name: 'ShortenedUrl',
  primary_key: :id,
  foreign_key: :url_id
end
