class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to pages_home_path }
      end
    else
      render :index
    end
  end

  def show
    @current_room = Room.find(params[:id])
    @messages = @current_room.messages
    respond_to do |format|
      format.html
      format.turbo_stream # This is necessary for Turbo Frame updates
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
