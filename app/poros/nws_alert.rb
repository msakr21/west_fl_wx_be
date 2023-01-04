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
    @effective_at = data[:effective]
    @ends_at = data[:ends]
    @status = data[:status]
    @severity = data[:severity]
    @event = data[:event]
    @description = data[:description]
    @instructions = data[:instructions]
    @response = data[:response]
  end
end
