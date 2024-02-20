require "helper"

class MariaDBTest < Minitest::Test
  def test_not_installed
    assert_equal "", `apt list --installed mariadb-server -q 2>/dev/null | grep installed`.strip
  end
end
