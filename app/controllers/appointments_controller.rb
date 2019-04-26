class AppointmentsController < ApplicationController
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.valid?

      # get all appointments belonging to schedule
      # all_appointment_timerange = @appointment.schedule.appointments.map{|k,v|[k.start_time, k.end_time]}
      #
      # # check if proposed start_time or end_time overlap with other appointments
      # all_appointment_timerange.each do |range|
      #   if (@appointment.start_time.between?(range[0], range[1]) || @appointment.end_time.between?(range[0], range[1]))
      #     render json: "Schedule overlap. Appointment not saved." and return
      #   end
      # end

      # if no overlap, following line will hit, saving appointment
      @appointment.save
      render json: @appointment
    else
      render json: "Invalid"
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment
      @appointment.destroy
    end
    render body: nil
  end

  private
  def appointment_params
    params.permit(:start_time, :end_time, :schedule_id)
  end
end
