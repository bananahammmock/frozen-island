class User < ActiveRecord::Base
    has_many :subscriptions
    has_many :themes, through: :subscriptions
    validates :phone_number, format: { with: /\d{3}\d{3}\d{4}/, message: "BE WHACK YO." }

def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.image = auth.info.image
    user.email = auth.info.email
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end

end
