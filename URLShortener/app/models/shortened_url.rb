# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ActiveRecord::Base

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  validates :short_url, :long_url, uniqueness: true

  def self.random_code
    code = SecureRandom.urlsafe_base64

    while true
      unless ShortenedUrl.exists?(code)
        return code
      end

    end
  end

  def self.short_url(user_object, long_url_string)
    ShortenedUrl.new(long_url: long_url_string,
      short_url: ShortenedUrl.random_code, user_id: user_object.id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visits.where({ created_at: (Time.now - 1.day)..Time.now })
  end

end
