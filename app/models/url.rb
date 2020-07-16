class Url < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :long_url, presence: true, length: { minimum: 10 }
  before_save { self.short_url = get_shurl }
  before_save :sanitize
  # validates :short_url, uniqueness: true

  def get_shurl
  	self.short_url = [*('a'..'z'),*('0'..'9')].shuffle[0,6].join
  end

  def sanitize 
  	long_url.strip!
  	sane_url = self.long_url.downcase.gsub(/(https?:\/\/) | (www\.)/,"")
  end

end
