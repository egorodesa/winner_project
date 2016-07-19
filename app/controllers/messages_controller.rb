class MessagesController < ApplicationController
  def index
    @receiver = User.find(params[:receiver_id])
# binding.pry
    # unless current_user.received_messages.where(sender: @receiver) &&
    #  @receiver.sent_messages.where(receiver: current_user)

    #     @allmessages << current_user.received_messages.where(sender: @receiver) <<
    #       @receiver.sent_messages.where(receiver: current_user)
    # end
    # @message = Message.new

    @messages =  Message.private_messages_array(@receiver.id)

  end

  def new
  end

  def create
   # binding.pry
    @message = Message.new(message_params)
    @message.receiver_id = params[:receiver_id]
    @message.save
    redirect_to chatting_path #(receiver_id: @message.receiver_id), method: :get

  end

  private

  def message_params
    params.require(:message).permit(:body,:sender_id,:receiver_id)
  end

end
