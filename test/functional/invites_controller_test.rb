require 'test_helper'

class InvitesControllerTest < ActionController::TestCase
  setup do
    @invite = invites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invite" do
    assert_difference('Invite.count') do
      post :create, invite: { accept: @invite.accept, group_id: @invite.group_id, username: @invite.username }
    end

    assert_redirected_to invite_path(assigns(:invite))
  end

  test "should show invite" do
    get :show, id: @invite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invite
    assert_response :success
  end

  test "should update invite" do
    put :update, id: @invite, invite: { accept: @invite.accept, group_id: @invite.group_id, username: @invite.username }
    assert_redirected_to invite_path(assigns(:invite))
  end

  test "should destroy invite" do
    assert_difference('Invite.count', -1) do
      delete :destroy, id: @invite
    end

    assert_redirected_to invites_path
  end
end
