require "helper"

class JavascriptNodeTest < Minitest::Test
  def test_node_18_installed
    assert_equal "v18.19.1",  nvm_exec(18, "node -v")
    assert_match( /10.4.\d+/, nvm_exec(18, "npm -v") )
    assert_match( /1.22.\d/,  nvm_exec(18, "yarn -v") )
  end

  def test_node_20_installed
    assert_equal "v20.11.1",  nvm_exec(20, "node -v")
    assert_match( /10.4.\d+/, nvm_exec(20, "npm -v") )
    assert_match( /1.22.\d/,  nvm_exec(20, "yarn -v") )
  end

  def test_node_21_installed
    assert_equal "v21.6.2",  nvm_exec(21, "node -v")
    assert_match( /10.4.\d+/, nvm_exec(21, "npm -v") )
    assert_match( /1.22.\d/,  nvm_exec(21, "yarn -v") )
  end

  private

  def nvm_exec(version, command)
    `bash -l -c "[ -s "~/.nvm/nvm.sh" ] && \. "~/.nvm/nvm.sh"; nvm use #{ version } --silent; #{ command }"`.strip
  end
end
