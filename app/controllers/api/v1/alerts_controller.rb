# frozen_string_literal: true

module Api
  module V1
    class AlertsController < ApplicationController
      def index
        @alerts = NwsFacade.escambia_alerts
        if @alerts.blank?
          render json: { data: 'No Current Alerts' }
        else
          render json: NwsAlertSerializer.new(@alerts)
        end
      end
    end
  end
end
