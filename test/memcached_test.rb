require "helper"
require "dalli"

class MemcachedTest < Minitest::Test
  def test_installed
    `sudo systemctl enable --now memcached`

    sleep 1
    memcache = Dalli::Client.new
    memcache.set "abc", 123
    value = memcache.get "abc"
    memcache.flush_all

    `sudo systemctl disable --now memcached`

    assert_equal 123, value
  end
end