Rails.application.routes.draw do
  root 'invites#new'

  resources :invites
  devise_for :users
  resources :users

  get 'authorize' => 'auth#gettoken'
  get 'authorize_session' => 'auth#getsession'

  get 'google_authorize' => 'auth#google_authorize'
  post 'authorize_noauth' => 'auth#noauth_session'
  post 'authorize_google' => 'auth#google_session'


  namespace :admin do
    root 'admin#index'
  end

  get "/invites/:id/accept" => "invites#accept", as: :accept_invite_path
  get "/invites/:id/decline" => "invites#decline", as: :decline_invite_path
  get "/invites/:id/report" => "invites#report", as: :report_invite_path
  patch "/invites/:id/report" => "invites#create_report", as: :create_report_invite_path
  patch "/invites/:id/deactivate" => "invites#deactivate", as: :deactivate_invite_path

  get "/terms-of-service" => "static_pages#terms_of_service", as: "terms_of_service" 
  get "/privacy-policy" => "static_pages#privacy_policy", as: "privacy_policy" 
end

# ================================= Routes, Raked ======================================== #
#                   Prefix Verb   URI Pattern                                 Controller#Action
#                     root GET    /                                           invites#new
#                  invites GET    /invites(.:format)                          invites#index
#                          POST   /invites(.:format)                          invites#create
#               new_invite GET    /invites/new(.:format)                      invites#new
#              edit_invite GET    /invites/:id/edit(.:format)                 invites#edit
#                   invite GET    /invites/:id(.:format)                      invites#show
#                          PATCH  /invites/:id(.:format)                      invites#update
#                          PUT    /invites/:id(.:format)                      invites#update
#                          DELETE /invites/:id(.:format)                      invites#destroy
#         new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                          PATCH  /users/password(.:format)                   devise/passwords#update
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST   /users(.:format)                            devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                          PATCH  /users(.:format)                            devise/registrations#update
#                          PUT    /users(.:format)                            devise/registrations#update
#                          DELETE /users(.:format)                            devise/registrations#destroy
#                    users GET    /users(.:format)                            users#index
#                          POST   /users(.:format)                            users#create
#                 new_user GET    /users/new(.:format)                        users#new
#                edit_user GET    /users/:id/edit(.:format)                   users#edit
#                     user GET    /users/:id(.:format)                        users#show
#                          PATCH  /users/:id(.:format)                        users#update
#                          PUT    /users/:id(.:format)                        users#update
#                          DELETE /users/:id(.:format)                        users#destroy
#               admin_root GET    /admin(.:format)                            admin/admin#index
#       accept_invite_path GET    /invites/:id/email/:email/accept(.:format)  invites#accept
#      decline_invite_path GET    /invites/:id/email/:email/decline(.:format) invites#decline
#       report_invite_path GET    /invites/:id/email/:email/report(.:format)  invites#report
