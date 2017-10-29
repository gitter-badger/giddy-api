# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Response
  include ExceptionHandler

  protect_from_forgery with: :exception
end
