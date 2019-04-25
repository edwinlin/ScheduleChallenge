class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :schedule_id
end
