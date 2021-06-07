module V1
    class SessionSerializer < ApplicationSerializer
        attributes :id, :user_agent, :device_id, :expires_at, :created_at
        attribute :as_jwt, key: :token
    end
end
  