class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by!(name: "Admin")
  end

  def current_employee
    @current_employee ||= Employee.find_by(email: "employee@example.com")
  end

  def current_client
    nil # no true client is ever signed in
  end

  impersonates :user
  impersonates :client, impersonator: :employee
end
