require 'test_helper'

class DungeonInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dungeon_instance = dungeon_instances(:one)
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
      post dungeon_instances_url, params: {}
    end

    assert_redirected_to dungeon_instance_url(DungeonInstance.last)
  end

  test "should show dungeon_instance" do
    get dungeon_instance_url(@dungeon_instance)
    assert_response :success
  end

  test "should update dungeon_instance" do
    patch dungeon_instance_url(@dungeon_instance), params: { direction: :top }
    assert_redirected_to dungeon_instance_url(@dungeon_instance)
  end

  test "should destroy dungeon_instance" do
    assert_difference('DungeonInstance.count', -1) do
      delete dungeon_instance_url(@dungeon_instance)
    end

    assert_redirected_to dungeon_instances_url
  end
end
