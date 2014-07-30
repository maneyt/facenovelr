class MessagesController < ApplicationController
  def create
    message = current_user.sent_messages.create(message_params)
    from_me = render_to_string(partial: "messages/sent", object: message, as: :message)
    to_someone_else = render_to_string(partial: "messages/received", object: message, as: :message)

    Pusher[message.recipient_id].trigger("send_message", {
      message_html: to_someone_else
    })
    Pusher[message.sender_id].trigger("send_message", {
      message_html: from_me
    })
  end

  private

  def message_params
    params.require(:message).permit(:body, :recipient_id)
  end
end
