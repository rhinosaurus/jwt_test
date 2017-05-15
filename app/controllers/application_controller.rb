class ApplicationController < ActionController::Base

    protected
    def is_logged_in
        if current_user.nil?
            redirect_to( :controller => 'access', :action => 'login' )
            return false
        else
            return true
        end
    end

    def current_user
        @current_token ||= JsonToken.decode( cookies[:auth_token] )
        @current_user ||= User.find( @current_token[:user_id] ) if cookies[:auth_token]
        return @current_user
    end
end
