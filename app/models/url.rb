class Url < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :long_url, presence: true, length: { minimum: 10 }
  # before_save :sanitize
  before_save { self.short_url = get_shurl }
  # validates :short_url, uniqueness: true

  def get_shurl
  	self.short_url = [*('a'..'z'),*('0'..'9'),*('A'..'Z')].shuffle[0,6].join
  end

  def find_duplicate
    # self.sanitize
    Url.find_by_long_url(self.long_url)
  end

  def new_url?
    find_duplicate.nil?
  end

  def sanitize 
  	long_url.strip!
  	sane_url = self.long_url.downcase.gsub(/(https?:\/\/) | (www\.)/,"")
    self.long_url = sane_url
  end

end
