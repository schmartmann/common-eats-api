module Authentication
    class PasswordStrategy < Strategy
        HTTP_AUTH_BASIC = 'Basic'

        def authenticate
            return unless valid?
            return unless auth_value

            email, password = ::Base64.decode64(auth_value).split(':', 2)
            user = User.find_by(email: email)&.authenticate(password)
            user ? Session.new(user: user) : nil      
        end

        private

        def valid?
          auth_type == HTTP_AUTH_BASIC
        end    
    end
end