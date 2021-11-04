class ApplicationController < ActionController::API

  def json_paylod
    HashWithIndifferentAccess.new(JSON.parse(request.raw_post))
  end
end
