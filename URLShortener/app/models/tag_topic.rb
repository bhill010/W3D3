# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ActiveRecord::Base
  has_many :tags,
    primary_key: :id,
    foreign_key: :topic_id,
    class: :Tagging
end
