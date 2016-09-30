require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'layouts/_header'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", news_path
    assert_select "a[href=?]", forums_path
    assert_select "a[href=?]", fishing_path
    assert_select "a[href='http://www.x-rates.com/table/?from=MXN&amount=1']"
    assert_select "a[href='http://www.accuweather.com/en/mx/los-barriles/236828/weather-forecast/236828#menu-country']"
  end
end