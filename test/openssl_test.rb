require "helper"

class OpenSSLTest < Minitest::Test
  def test_version_3_installed
    assert_equal \
      "OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)",
      `openssl version`.strip
  end

  def test_version_1_installed
    assert_equal \
      "OpenSSL 1.1.1w  11 Sep 2023",
      `/opt/openssl-1.1.1w/bin/openssl version`.strip
  end
end
