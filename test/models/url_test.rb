require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.create(name: "Name", email: "user@email.com", password: "password", password_confirmation: "password")
  	@url = Url.new(name: "My Url", long_url: "https://www.whyisthissuchalongurl.com", user: @user)
  end

  test "should be valid" do
  	assert @url.valid?
  end

  test "long_url should be present" do
  	@url.long_url = "   "
  	assert_not @url.valid?
  end

  test "long_url should be at least 10 characters in length" do
  	@url.long_url = "yahoo.com"
  	assert_not @url.valid?
  end

  test "should not accept invalid url" do
  	@url.long_url = "www.something"
  	assert_not @url.valid?
  end

end