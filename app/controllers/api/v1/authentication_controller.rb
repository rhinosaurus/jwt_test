module Api::V1

    class AuthenticationController < ApiController
        skip_before_action :authenticate

=begin
@api {post} /authenticate Login
@apiName Login
@apiGroup Login

@apiParam {String} email Users Email.
@apiParam {String} password Users Password.

@apiSuccess {String} auth_token Authorization Token that must be sent with every request.
=end
        def auth
            command = Authenticate.call(params[:email], params[:password])

            if command.success?
                render json: { auth_token: command.result }
            else
                render json: { error: command.errors }, status: :unauthorized
            end
        end
    end

end
