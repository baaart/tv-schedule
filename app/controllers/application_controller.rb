class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActionController::RoutingError do
    logger.error 'Routing error occurred'
    render json: '404 Not found', status: 404
  end
end
