module Authentication
    class TokenStrategy < Strategy
      HTTP_AUTH_BEARER = 'Bearer'
  
      def authenticate
        return unless auth_value
        return unless valid?
  
        Session.from_jwt(auth_value)
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError, JWT::ExpiredSignature
        nil
      end
  
      private
  
      def valid?
        auth_type == HTTP_AUTH_BEARER
      end
    end
  end
  