class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{params['trap_id']}"
    p ''
    p ''
    p params['trap_id']
    p ''
    p ''

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! data['message']
  #  ActionCable.server.broadcast 'room_channel', message: data['message']
  #  ActionCable.server.broadcast "trap_/#{message['trap_id']}", message: render_message(message)

  end
end
