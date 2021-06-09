module Authentication
    class Strategy
        attr_reader :request

        def initialize(request)
            @request = request
        end

        def authenticate; end

        private 

        def auth_header
            @auth_header ||= request.authorization.to_s.split(' ', 2)
        end

        def auth_type
            auth_header.first
        end

        def auth_value
            auth_header.last
        end
    end
end
