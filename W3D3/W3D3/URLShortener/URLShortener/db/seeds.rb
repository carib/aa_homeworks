# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(email: 'user1@usermail.com')
  user2 = User.create!(email: 'user2@usermail.com')
  user3 = User.create!(email: 'user3@usermail.com')
  user4 = User.create!(email: 'user4@usermail.com')
  user5 = User.create!(email: 'user5@usermail.com')
  user6 = User.create!(email: 'user6@usermail.com')
  user7 = User.create!(email: 'user7@usermail.com')

  ShortenedUrl.destroy_all
  url1 = ShortenedUrl.create!(short_url: user1.shorten_url('www.urlurlurlurl.com'), long_url: 'www.urlurlurlurl.com', user_id: user1.id)
  url2 = ShortenedUrl.create!(short_url: user2.shorten_url('www.urlurlurlurl2.com'), long_url: 'www.urlurlurlurl2.com', user_id: user1.id)
  url3 = ShortenedUrl.create!(short_url: user3.shorten_url('www.urlurlurlurl3.com'), long_url: 'www.urlurlurlurl3.com', user_id: user1.id)
  url4 = ShortenedUrl.create!(short_url: user4.shorten_url('www.urlurlurlurl4.com'), long_url: 'www.urlurlurlurl4.com', user_id: user1.id)
  url5 = ShortenedUrl.create!(short_url: user5.shorten_url('www.urlurlurlurl5.com'), long_url: 'www.urlurlurlurl5.com', user_id: user3.id)
  url6 = ShortenedUrl.create!(short_url: user6.shorten_url('www.urlurlurlurl6.com'), long_url: 'www.urlurlurlurl6.com', user_id: user5.id)
  url7 = ShortenedUrl.create!(short_url: user1.shorten_url('www.urlurlurlurl7.com'), long_url: 'www.urlurlurlurl7.com', user_id: user6.id)
  url8 = ShortenedUrl.create!(short_url: user1.shorten_url('www.urlurlurlurl8.com'), long_url: 'www.urlurlurlurl8.com', user_id: user4.id)
  url9 = ShortenedUrl.create!(short_url: user1.shorten_url('www.urlurlurlurl9.com'), long_url: 'www.urlurlurlurl9.com', user_id: user2.id)

  Visit.destroy_all
  Visit.create!(user_id: user1.id, url_id: url1.id)
  Visit.create!(user_id: user2.id, url_id: url2.id)
  Visit.create!(user_id: user3.id, url_id: url3.id)
  Visit.create!(user_id: user4.id, url_id: url4.id)
  Visit.create!(user_id: user5.id, url_id: url5.id)
  Visit.create!(user_id: user6.id, url_id: url6.id)
  Visit.create!(user_id: user7.id, url_id: url7.id)
  Visit.create!(user_id: user1.id, url_id: url8.id)
  Visit.create!(user_id: user1.id, url_id: url9.id)
  Visit.create!(user_id: user1.id, url_id: url1.id)
  Visit.create!(user_id: user1.id, url_id: url1.id)
  Visit.record_visit!(user1, url1)
  Visit.record_visit!(user2, url1)
  Visit.record_visit!(user3, url1)
  Visit.record_visit!(user4, url1)
  Visit.record_visit!(user5, url1)
  Visit.record_visit!(user6, url1)

  TagTopic.destroy_all
  topic1 = TagTopic.create!(topic: 'Sports!')
  topic2 = TagTopic.create!(topic: 'Emo Jams')
  topic3 = TagTopic.create!(topic: 'Wine Smelling')
  topic4 = TagTopic.create!(topic: 'Dinosaurs')
  topic5 = TagTopic.create!(topic: 'Dinosaurs the TV Show')
  topic6 = TagTopic.create!(topic: 'Thanksgiving')
  #
  Tagging.destroy_all
  Tagging.create!(topic_id: topic1.id, url_id: url3.id)
  Tagging.create!(topic_id: topic2.id, url_id: url1.id)
  Tagging.create!(topic_id: topic3.id, url_id: url2.id)
  Tagging.create!(topic_id: topic4.id, url_id: url6.id)
  Tagging.create!(topic_id: topic4.id, url_id: url7.id)
  Tagging.create!(topic_id: topic4.id, url_id: url8.id)
  Tagging.create!(topic_id: topic5.id, url_id: url5.id)
  Tagging.create!(topic_id: topic6.id, url_id: url4.id)
  Tagging.create!(topic_id: topic5.id, url_id: url9.id)









end
