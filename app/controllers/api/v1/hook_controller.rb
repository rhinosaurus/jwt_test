module Api::V1

    class HookController < ApiController
        skip_before_action :authenticate
        before_action :check_token

        def update
            begin
                @class = Object.const_get "#{params[:type]}"
                if params[:class_action] == 'create'
                    class_instance = @class.new
                elsif params[:class_action] == 'update'
                    class_instance = @class.find( params[:class_id] ) if params[:class_id].present?
                end

                if params[:data]
                    params[:data].each do |k,v|
                        class_instance[ k.to_sym ] = v
                    end
                    class_instance.save
                end

                render json: { :success => true, params[:type].to_sym => class_instance }
            rescue Exception => ex
                render json: { :success => false, :error => 'Could not perform action.' }
            end
        end

        def check_token
            begin
                @hook = Webhook.find_by( :token => params[:id] )
            rescue Exception => ex
                render json: { :success => false, :error => 'Could not find the token provided.' }
            end
        end
    end

end
