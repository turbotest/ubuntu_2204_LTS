require "helper"
require "json"

class ElasticSearchTest < Minitest::Test
  def test_systemctl_enabled
    `sudo systemctl enable --now elasticsearch`
    config = JSON.parse %x{ curl --silent localhost:9200 }
    `sudo systemctl disable --now elasticsearch`

    assert_match(/elasticsearch/, config["cluster_name"])
  end
end
