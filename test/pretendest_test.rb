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

  def test_impersonate_with_other_resource
    employee = Employee.create!(email: "employee@example.com")
    client = Client.create!(name: "Client")

    get clients_url
    assert_response :success

    assert_equal employee, current_employee
    assert_nil current_client
    refute impersonating_client?
    assert_equal employee, client_impersonator

    post impersonate_client_url(client.id)
    assert_response :success

    assert_equal employee, current_employee
    assert_equal client, current_client
    assert_nil true_client
    assert impersonating_client?
    assert_equal employee, client_impersonator

    post stop_impersonating_clients_url
    assert_response :success

    assert_equal employee, current_employee
    assert_nil current_client
    refute impersonating_client?
    assert_equal employee, client_impersonator
  end

  private

  delegate :current_user, :true_user, :impersonating_user?,
           :current_client, :true_client, :impersonating_client?, :client_impersonator,
           :current_employee,
    to: :controller
end
