Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root to: redirect('/access/login')

    get "access/login"
    get "home/index"

    namespace :api do
        namespace :v1 do
            post 'authenticate', to: 'authentication#auth'
            resources :items
            resources :hook
        end
    end
end
