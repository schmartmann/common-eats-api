module RequestSpecHelper
    def json
        parsed = JSON.parse(response.body)
        case parsed
        when Hash then parsed.with_indifferent_access
        when Array then parsed.map(&:with_indifferent_access)
        else parsed
        end
    end
    
    def token_auth(user_or_session)
        session = if user_or_session.respond_to?(:as_jwt)
                    user_or_session
                  else
                    user_or_session.sessions.active.first_or_create
                  end
        "Bearer #{session.as_jwt}"
    end    
end

RSpec.configure do |config|
    config.include RequestSpecHelper, type: :request
end
    