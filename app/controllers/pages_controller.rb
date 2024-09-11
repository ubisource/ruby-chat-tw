class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @rooms = Room.all
    @messages = Message.all
    # @message = current_user.messages.build
  end
end
