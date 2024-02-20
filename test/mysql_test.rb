require "helper"
require "mysql2"

class MySQLTest < Minitest::Test
  def test_version_8_installed
    `sudo systemctl enable --now mysql`

    mysql = Mysql2::Client.new
    results = mysql.query "SELECT version()"
    mysql.close

    `sudo systemctl disable --now mysql`

    assert_match( /8\.0\.\d+/, results.map(&:values).flatten.first )
  end
end
