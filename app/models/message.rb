class Message < ActiveRecord::Base
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id

  def self.private_messages_array(receiver_id)
    # unless current_user.received_messages.where(sender: @receiver) &&
    # @receiver.sent_messages.where(receiver: current_user)

        @messages = current_user.received_messages.where(sender: @receiver) +
          @receiver.sent_messages.where(receiver: current_user)
    # end
  end
end
