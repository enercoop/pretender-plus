require_relative "test_helper"

class PretendestTest < ActionDispatch::IntegrationTest
  def setup
    User.delete_all
  end

  def test_works
    admin = User.create!(name: "Admin")
    user = User.create!(name: "User")

    get users_url
    assert_response :success

    assert_equal admin, current_user
    assert_equal admin, true_user
    refute impersonating_user?

    post impersonate_user_url(user.id)
    assert_response :success

    assert_equal user, current_user
    assert_equal admin, true_user
    assert impersonating_user?

    post stop_impersonating_users_url
    assert_response :success

    assert_equal admin, current_user
    assert_equal admin, true_user
    refute impersonating_user?
  end

  private

  delegate :current_user, :true_user, :impersonating_user?, to: :controller
end
