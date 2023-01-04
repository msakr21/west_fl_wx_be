# frozen_string_literal: true

module Api
  module V1
    class AlertsController < ApplicationController
      def index
        @alerts = NwsFacade.escambia_alerts
        render json: @alerts
      end
    end
  end
end
