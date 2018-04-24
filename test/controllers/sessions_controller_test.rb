require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new    $google_auth_hash
  end

  teardown do
    OmniAuth.config.test_mode = false
  end

  test 'should create' do
    get '/auth/google_oauth2'
    follow_redirect!
    assert_redirected_to dungeon_instances_url
  end

end
