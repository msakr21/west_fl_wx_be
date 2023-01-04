class NwsAlertSerializer
  include JSONAPI::Serializer

  attributes  :areas_affected,
              :effective_at,
              :ends_at,
              :status,
              :severity,
              :event,
              :description,
              :instructions,
              :response
end
