# app/controllers/application_controller.rb
class BaseApiController < ActionController::API
  include Response
  include ExceptionHandler
end