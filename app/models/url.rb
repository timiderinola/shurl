class Url < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :long_url, presence: true, length: { minimum: 10 }
  validates_url :long_url

  before_save { self.long_url = self.sanitize }
  before_save { self.short_url = get_shurl }

  def get_shurl
    short_url = [*('a'..'z'),*('0'..'9'),*('A'..'Z')].shuffle[0,6].join
    if short_url_taken?(short_url)
      self.get_shurl
    else
      self.short_url = short_url
    end
  end

  def short_url_taken?(short_url)
    Url.find_by_short_url(short_url)
  end

  def find_duplicate
    # self.sanitize
    Url.find_by_long_url(self.long_url)
  end

  def new_url?
    find_duplicate.nil?
  end

  def clicked!
    self.click = self.click + 1
  end

  def sanitize 
    self.long_url.strip!
    self.long_url.gsub(/(https?:\/\/) | (www\.)/,"")
  end

end
