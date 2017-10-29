# frozen_string_literal: true

class Api::V1::BaseController < ActionController::API
  include Knock::Authenticable
  include Response
  include ExceptionHandler
end
