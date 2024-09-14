class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.new(room_params)
    if @room.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to pages_home_path, notice: 'Room was successfully created.' }
      end
    else
      render :index
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to pages_home_path, notice: 'Room was successfully deleted.' }
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
