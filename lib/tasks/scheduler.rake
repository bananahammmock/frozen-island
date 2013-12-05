task :send_texts => :environment do

  User.all.each do |user|

    user.themes.each do |theme|

      current_inspiration = theme.inspirations.first(:order => "RANDOM()")

      number_to_send_to = user.phone_number
      twilio_sid = "AC4eada82bf78d9b4111871a0148af29a8"
      twilio_token = "7487cd98f26533f386dbfcfb70570a73"
      twilio_phone_number = "7142942970"
      twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
      text = twilio_client.account.messages.create(
        :from => "+1#{twilio_phone_number}",
        :to => number_to_send_to,
        :body => "#{theme.name}: #{current_inspiration.quote}"
      )

    end

  end

end