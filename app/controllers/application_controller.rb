class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV["username"], password: ENV["password"]
  protect_from_forgery with: :null_session
end
