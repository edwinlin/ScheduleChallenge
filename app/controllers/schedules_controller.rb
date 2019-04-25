class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    render json: @schedules
  end

  def show
    @schedule = Schedule.find(params[:id])
    render json: @schedule
  end

  def create
    @schedule = Schedule.create(schedule_params)
    render json: @schedule
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule
      @schedule.destroy
    end
    render body:nil
  end

  # def update
  #   @schedule = Schedule.find(params[:id])
  #   render json: @schedule
  # end

  private
  def schedule_params
    params.permit(:name)
  end

end
