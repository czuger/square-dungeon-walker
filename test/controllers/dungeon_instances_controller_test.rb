require 'test_helper'

class DungeonInstancesControllerTest < ActionDispatch::IntegrationTest

  setup do
    OmniAuth.config.test_mode = true

    @dungeon_instance = create( :dungeon_instance )
    $google_auth_hash[:uid] = @dungeon_instance.user.uid
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new    $google_auth_hash
    get '/auth/google_oauth2'
    follow_redirect!
  end

  teardown do
    OmniAuth.config.test_mode = false
  end

  test "should get index" do
    get dungeon_instances_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_dungeon_instance_url
  #   assert_response :success
  # end

  test "should create dungeon_instance" do
    assert_difference('DungeonInstance.count') do
      post dungeon_instances_url, params: { dungeon_instance: { size: 3, difficulty: :medium, hero1_level: 1, hero2_level: 1, hero3_level: 1 } }
    end

    assert_redirected_to dungeon_instance_play_url(DungeonInstance.last)
  end

  test "should show dungeon_instance" do
    get dungeon_instance_url(@dungeon_instance)
    assert_response :success
  end

  # test "should update dungeon_instance" do
  #   patch dungeon_instance_url(@dungeon_instance), params: { direction: :top }
  #   assert_redirected_to dungeon_instance_url(@dungeon_instance)
  # end

  test 'should clear room' do
    patch dungeon_instance_clear_room_url(@dungeon_instance)
    assert_redirected_to dungeon_instance_play_url(@dungeon_instance)
  end

  test "should destroy dungeon_instance" do
    assert_difference('DungeonInstance.count', -1) do
      delete dungeon_instance_url(@dungeon_instance)
    end

    assert_redirected_to dungeon_instances_url
  end
end
