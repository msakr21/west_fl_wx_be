# frozen_string_literal: true

class NwsAlert
  attr_reader :id,
              :areas_affected,
              :effective_at,
              :ends_at,
              :status,
              :severity,
              :event,
              :description,
              :instructions,
              :response

  def initialize(data)
    @id = data[:id]
    @areas_affected = data[:areaDesc]
    @effective_at = Time.parse(data[:effective]).strftime('%A at%l:%M%P, %B%e, %Y').lstrip
    @ends_at = Time.parse(data[:ends]).strftime('%A at%l:%M%P, %B%e, %Y').lstrip
    @status = data[:status]
    @severity = data[:severity]
    @event = data[:event]
    @description = data[:description]
    @instructions = data[:instructions]
    @response = data[:response]
  end
end
