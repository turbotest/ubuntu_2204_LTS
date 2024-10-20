require "helper"

class RubyTest < Minitest::Test
  def test_2_7_8_installed
    assert_match( /ruby 2\.7\.8/, ruby_version( chruby:"2.7.8" ) )
    assert_match( /2\.1\.4/,      openssl_version( chruby:"2.7.8" ) )
  end

  def test_3_0_6_installed
    assert_match( /ruby 3\.0\.6/, ruby_version( chruby:"3.0.6" ) )
    assert_match( /2\.2\.2/,      openssl_version( chruby:"3.0.6" ) )
  end

  def test_3_1_4_installed
    assert_match( /ruby 3\.1\.4/, ruby_version( chruby:"3.1.4" ) )
    assert_match( /3\.0\.1/,      openssl_version( chruby:"3.1.4" ) )
  end

  def test_3_2_3_installed
    assert_match( /ruby 3\.2\.3/, ruby_version( chruby:"3.2.3" ) )
    assert_match( /3\.1\.0/,      openssl_version( chruby:"3.2.3" ) )
  end

  def test_3_3_x_installed(versions=0..5)
    versions.each do |version|
      assert_match( /ruby 3\.3\.#{ version }/, ruby_version( chruby:"3.3.#{ version }" ) )
      assert_match( /3\.2\.0/,      openssl_version( chruby:"3.3.0" ) )
    end
  end

  private

  def ruby_version(chruby:)
    chruby_exec chruby, "ruby -v"
  end

  def openssl_version(chruby:)
    chruby_exec chruby, "ruby -r openssl -e 'puts OpenSSL::VERSION'"
  end

  def chruby_exec(version, command)
    `bash -l -c "source ~/.bash_profile; chruby #{ version }; #{ command }"`.strip
  end
end
