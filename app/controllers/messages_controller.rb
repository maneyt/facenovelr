class MessagesController < ApplicationController
  def create
    message = current_user.sent_messages.create(message_params)
    push_message = render message
    Pusher[message.recipient_id].trigger("new_message", {
      message_html: push_message
    })
    Pusher[message.sender_id].trigger("send_message", {
      message_html: push_message
    })
  end

  private

  def message_params
    params.require(:message).permit(:body, :recipient_id)
  end
end
