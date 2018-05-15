class Api::ApiController < Amber::Controller::Base
  def index
    {"test": "test"}.to_json
  end
end

