require "helper"
require "bunny"

class RabbitMQTest < Minitest::Test
  def test_installed
    `sudo systemctl enable --now rabbitmq-server`

    conn = Bunny.new
    conn.start
    channel = conn.create_channel
    queue   = channel.queue "test_queue"
    channel.default_exchange.publish "OHAi!", routing_key: queue.name

    _, _, message = channel.basic_get queue.name

    assert_equal "OHAi!", message

  ensure
    conn.close
    `sudo systemctl disable --now rabbitmq-server`
  end
end
