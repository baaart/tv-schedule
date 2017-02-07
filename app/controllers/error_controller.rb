class ErrorController < ApplicationController
  def catch_404
    raise ActionController::RoutingError.new(params[:path]), 'Not found'
  end
end
