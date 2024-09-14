module MessagesHelper
  def message_alignment(current_user, message)
    current_user.id == message.user.id ? 'justify-end' : 'justify-start'
  end

  def message_style(current_user, message)
    current_user.id == message.user.id ? 'bg-gray-400 rounded-bl-3xl rounded-tl-3xl rounded-tr-xl' : 'bg-blue-400 rounded-br-3xl rounded-tr-3xl rounded-tl-xl'
  end

  def message_timestamp_position(current_user, message)
    current_user.id == message.user.id ? 'right-3' : 'left-3'
  end
end
