# == Schema Information
#
# Table name: sessions
#
#  id         :uuid             not null, primary key
#  expires_at :datetime
#  user_agent :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :string
#  user_id    :uuid
#
class Session < ApplicationRecord
    belongs_to :user, inverse_of: :sessions

    JWT_ISSUER = 'Drivers Co-op API'
    JWT_ALGORITHM = 'HS256'
    JWT_HMAC_SECRET = Rails.application.secret_key_base
  
    def as_jwt
      JWT.encode({
                   sub: id,
                   iss: JWT_ISSUER,
                   exp: expires_at.to_i
                 }, JWT_HMAC_SECRET, JWT_ALGORITHM)
    end
  
    def self.from_jwt(jwt)
      session_id = JWT.decode(
        jwt, JWT_HMAC_SECRET, true, algorithm: JWT_ALGORITHM, iss: JWT_ISSUER, verify_iss: true
      ).first['sub']
      active.find(session_id)
    end

    private

    DEFAULT_EXPIRY = 2.weeks
  
    def set_expires_at
      self.expires_at = DEFAULT_EXPIRY.from_now
    end  
end
