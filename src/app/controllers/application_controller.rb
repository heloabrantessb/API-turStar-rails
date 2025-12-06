class ApplicationController < ActionController::API
  include Authentication
  include Pundit::Authorization
end
