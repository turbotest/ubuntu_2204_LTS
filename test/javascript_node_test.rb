require "helper"

class JavascriptNodeTest < Minitest::Test
  def test_node_installed
    assert_node_installed 18
    # assert_node_installed 19
    assert_node_installed 20
    assert_node_installed 21
    assert_node_installed 22
    assert_node_installed 23
  end

  def assert_node_installed(version)
    assert_match( /v#{ version }.*/, nvm_exec(version, "node -v") )
    assert_match( /10.*/,            nvm_exec(version, "npm -v") )
    assert_match( /1.22.*/,          nvm_exec(version, "yarn -v") )
  end

  private

  def nvm_exec(version, command)
    `bash -l -c "[ -s "~/.nvm/nvm.sh" ] && \. "~/.nvm/nvm.sh"; nvm use #{ version } --silent; #{ command }"`.strip
  end
end
