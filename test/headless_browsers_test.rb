require "helper"

class HeadlessBrowsersTest < Minitest::Test
  def test_chrome_installed
    assert_equal "/opt/chrome/chrome", `which chrome`.strip
    assert_equal "Google Chrome for Testing 121.0.6167.85", `chrome --version`.strip
  end

  def test_chromedriver_installed
    assert_equal "/opt/chromedriver/chromedriver", `which chromedriver`.strip
    assert_match(/ChromeDriver 121.0.6167.85/, `chromedriver --version`.strip)
  end

  def test_firefox_installed
    skip "Not working :("
    assert_equal "/opt/firefox/firefox", `which firefox`.strip
    assert_match( /Mozilla Firefox \d+/, `firefox --version`.strip ) 
  end
end
