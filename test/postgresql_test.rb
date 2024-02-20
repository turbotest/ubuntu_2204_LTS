require "helper"
require "pg"

class PostgreSQLTest < Minitest::Test
  def test_12_installed
    enable 12 do
      assert_match( /PostgreSQL 12\.\d+/, db_version )
    end
  end

  def test_13_installed
    enable 13 do
      assert_match( /PostgreSQL 13\.\d+/, db_version )
    end
  end

  def test_14_installed
    enable 14 do
      assert_match( /PostgreSQL 14\.\d+/, db_version )
    end
  end

  def test_15_installed
    enable 15 do
      assert_match( /PostgreSQL 15\.\d+/, db_version )
    end
  end

  def test_16_installed
    enable 16 do
      assert_match( /PostgreSQL 16\.\d+/, db_version )
    end
  end

  private

  def db_version
    postgres = PG.connect dbname: "postgres"
    result   = postgres.exec "SELECT version();"

    result.first['version']
  ensure
    postgres&.close
  end

  def enable(version)
    `sudo systemctl enable --now postgresql@#{ version }-main.service`
    yield
  ensure
    `sudo systemctl disable --now postgresql@#{ version }-main.service`
  end
end
