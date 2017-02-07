module Api
  module V1
    class SchedulesController < ApplicationController
      def index
        @schedules = Schedule.all
        render json: @schedules, include: ['show.category', 'channel']
      end

      def show
        @schedule = Schedule.find(params[:id])
        render json: @schedule
      end

      def search
        @schedules = Schedule.joins(:show)
                             .joins(:channel)
                             .where('shows.name ILIKE ? OR channels.name ILIKE ? ',
                                    "%#{params[:q]}%", "%#{params[:q]}%")
        render json: @schedules, include: ['show.category', 'channel']
      end
    end
  end
end
