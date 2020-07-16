require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.create(name: "Test User", email: "test@user.com",
  											password: "testuser", password_confirmation: "testuser")
  	@url = Url.new(name: "My Url", long_url: "https://www.whyisthissuchalongurl.com?response=dunno", short_url: "shurl.com/dunno", user: @user)
  end

  test "should be valid" do
  	assert @url.valid?
  end

  test "long_url should be present" do
  	@url.long_url = "   "
  	assert_not @url.valid?
  end

end
