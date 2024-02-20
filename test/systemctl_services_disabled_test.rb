require "helper"

class SystemctlServicesDisabledTest < Minitest::Test
  def setup
    @running ||= `sudo systemctl -t service --state=running --no-legend --no-pager`
  end

  def test_elastic_search_disabled
    refute_match( /elasticsearch/, @running )
  end

  def test_memcached_disabled
    refute_match( /memcached/, @running )
  end

  def test_redis_disabled
    refute_match( /redis/, @running )
  end

  def test_mysql_disabled
    refute_match( /mysql/, @running )
  end

  def test_postgresql_disabled
    refute_match( /postgresql/, @running )
  end

  def test_rabbitmq_disabled
    refute_match( /rabbitmq/, @running )
  end
end
