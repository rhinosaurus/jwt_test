module Api::V1

    class ApiController < ActionController::API
        include ActionController::Serialization
        before_action :authenticate
        attr_reader :current_user

        def authenticate
            @current_user = Authorize.call(request.headers).result
            render json: { error: 'Not Authorized' }, status: 401 unless @current_user
        end
    end

end
