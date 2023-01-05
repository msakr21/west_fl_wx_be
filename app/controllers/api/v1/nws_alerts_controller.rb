# frozen_string_literal: true

module Api
  module V1
    class NwsAlertsController < ApplicationController
      def index
        @alerts = NwsFacade.escambia_alerts
        if @alerts.blank?
          render json: { data: 'No Current Alerts' }
        else
          render json: { data: 'Current Alerts in Your Area' }
        end
      end
    end
  end
end
