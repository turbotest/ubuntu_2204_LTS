require "helper"

class HeadlessBrowsersTest < Minitest::Test
  def test_chrome_installed
    assert_equal "/opt/chrome/chrome", `which chrome`.strip
    assert_match( /Google Chrome for Testing/, `chrome --version`.strip )
  end

  def test_chromedriver_installed
    assert_equal "/opt/chromedriver/chromedriver", `which chromedriver`.strip
    assert_match( /ChromeDriver/, `chromedriver --version`.strip )
  end

  def test_firefox_installed
    assert_equal "/opt/firefox/firefox", `which firefox`.strip
    assert_match( /Mozilla Firefox/, `firefox --version`.strip )
  end
end
