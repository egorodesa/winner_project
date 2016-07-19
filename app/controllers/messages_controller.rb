class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @receiver_user = User.find(params[:receiver_id])
# binding.pry
    # unless current_user.received_messages.where(sender: @receiver) &&
    #  @receiver.sent_messages.where(receiver: current_user)

    # @messages = current_user.received_messages.where(sender_id: @receiver.id) +
    #             @receiver_user.received_messages.where(sender_id: current_user.id)
# binding.pry
@messages = []
    # unless current_user.sent_messages
      @messages += current_user.sent_messages.where(receiver: @receiver_user)#.to_ary
    # end
    # unless @receiver_user.sent_messages
      @messages += @receiver_user.sent_messages.where(receiver: current_user)#.to_ary
    # end
# binding.pry
    # @messages = current_user.sent_messages.where(receiver_id: @receiver.id) +
    #             @receiver_user.sent_messages.where(receiver_id: current_user.id)
    # # end


    # @message = Message.new
    @message = Message.new
    # @messages =  Message.private_messages_array(@receiver.id)

  end

  def new
  end

  def create
   # binding.pry
    @message = Message.new(message_params)
    @message.receiver_id = params[:receiver_id]
    @message.sender_id = current_user.id
    @message.save
    redirect_to chatting_path #(receiver_id: @message.receiver_id), method: :get

  end

  private

  def message_params
    params.require(:message).permit(:body,:sender_id,:receiver_id)
  end

end
