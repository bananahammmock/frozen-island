class SendTextController < ApplicationController
  def index
  end
 
  def send_text_message
    number_to_send_to = params[:number_to_send_to]
 
    twilio_sid = "AC36e64b3609395ff2a3ddd0fa70cec648"
    twilio_token = "52c36e153c4f245a8f49670d63896fbd"
    twilio_phone_number = "5005550006"
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is an message. It gets sent to #{number_to_send_to}"
    )
  end
end