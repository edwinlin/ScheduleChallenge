class Appointment < ApplicationRecord
  belongs_to :schedule

  validates :start_time, :end_time, :schedule_id, presence: true
  validate :end_time_is_after_start_time

  private
  def end_time_is_after_start_time
    if end_time <= start_time
      errors.add(:end_time, "invalid end time")
    end
  end

end
