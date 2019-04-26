class Appointment < ApplicationRecord
  belongs_to :schedule

  validates :start_time, :end_time, :schedule_id, presence: true
  validate :end_time_is_after_start_time
  validate :check_schedule

  private
  def end_time_is_after_start_time
    if end_time <= start_time
      errors.add(:end_time, "invalid end time")
    end
  end

  def check_schedule
    all_appt = schedule.appointments.map{|k,v|[k.start_time, k.end_time]}

    all_appt.each do |appt|
      if(start_time.between?(appt[0], appt[1]) || end_time.between?(appt[0], appt[1]))
        errors.add(:start_time, "overlap")
      end
    end
  end
end
