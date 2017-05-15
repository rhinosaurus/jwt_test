class AccessController < ApplicationController

    before_action :is_logged_in, :except => [:attempt_login, :login]

    def login
    end

    private

    def go_home
        redirect_to :controller => :home, :action => 'index'
    end

end
