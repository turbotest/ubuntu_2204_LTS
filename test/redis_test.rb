require "helper"
require "redis"

class RedisTest < Minitest::Test
  def test_installed
    `sudo systemctl enable --now redis-server`

    redis = Redis.new
    redis.set "foo", "bar"
    assert_equal "bar", redis.get("foo")
  ensure
    `sudo systemctl disable --now redis-server`
  end
end
