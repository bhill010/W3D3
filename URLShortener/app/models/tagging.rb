# == Schema Information
#
# Table name: taggings
#
#  id           :integer          not null, primary key
#  short_url_id :integer          not null
#  topic_id     :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Tagging < ActiveRecord::Base

  belongs_to :short_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl

  belongs_to :tag_topics,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :TagTopic
end
