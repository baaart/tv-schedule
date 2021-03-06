module Api
  module V1
    class ShowsController < ApplicationController
      def index
        @shows = Show.all
        render json: @shows
      end

      def show
        @show = Show.find(params[:id])
        render json: @show
      end
    end
  end
end
