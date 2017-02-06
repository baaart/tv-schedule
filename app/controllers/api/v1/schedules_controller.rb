module Api
  module V1
    class UsersController < ApplicationController
      def index
        @schedules = Schedule.all
        render json: @schedules
      end

      def show
        @schedule = Schedule.find(params[:id])
        render json: @schedule
      end
    end
  end
end
