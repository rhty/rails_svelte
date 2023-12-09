class Admin::ApplicationController < ActionController::Base
  before_action :authenticate

  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["ADMIN_USERNAME"] &&
        Digest::SHA256.hexdigest(password) == ENV["ADMIN_PASSWORD_HASH"]
      end
    end
end
