# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                      new_user_session GET    /login(.:format)                                                                         devise/sessions#new
#                          user_session POST   /login(.:format)                                                                         devise/sessions#create
#                  destroy_user_session DELETE /logout(.:format)                                                                        devise/sessions#destroy
#                     new_user_password GET    /password/new(.:format)                                                                  devise/passwords#new
#                    edit_user_password GET    /password/edit(.:format)                                                                 devise/passwords#edit
#                         user_password PATCH  /password(.:format)                                                                      devise/passwords#update
#                                       PUT    /password(.:format)                                                                      devise/passwords#update
#                                       POST   /password(.:format)                                                                      devise/passwords#create
#              cancel_user_registration GET    /cancel(.:format)                                                                        devise/registrations#cancel
#                 new_user_registration GET    /register(.:format)                                                                      devise/registrations#new
#                edit_user_registration GET    /edit(.:format)                                                                          devise/registrations#edit
#                     user_registration PATCH  /                                                                                        devise/registrations#update
#                                       PUT    /                                                                                        devise/registrations#update
#                                       DELETE /                                                                                        devise/registrations#destroy
#                                       POST   /                                                                                        devise/registrations#create
#                            portfolios GET    /portfolios(.:format)                                                                    portfolios#index
#                                       POST   /portfolios(.:format)                                                                    portfolios#create
#                         new_portfolio GET    /portfolios/new(.:format)                                                                portfolios#new
#                        edit_portfolio GET    /portfolios/:id/edit(.:format)                                                           portfolios#edit
#                             portfolio PATCH  /portfolios/:id(.:format)                                                                portfolios#update
#                                       PUT    /portfolios/:id(.:format)                                                                portfolios#update
#                                       DELETE /portfolios/:id(.:format)                                                                portfolios#destroy
#                        portfolio_show GET    /portfolio/:id(.:format)                                                                 portfolios#show
#                         angular_items GET    /angular-items(.:format)                                                                 portfolios#angular
#                                 about GET    /about(.:format)                                                                         pages#about
#                               contact GET    /contact(.:format)                                                                       pages#contact
#                    toggle_status_blog GET    /blogs/:id/toggle_status(.:format)                                                       blogs#toggle_status
#                                 blogs GET    /blogs(.:format)                                                                         blogs#index
#                                       POST   /blogs(.:format)                                                                         blogs#create
#                              new_blog GET    /blogs/new(.:format)                                                                     blogs#new
#                             edit_blog GET    /blogs/:id/edit(.:format)                                                                blogs#edit
#                                  blog GET    /blogs/:id(.:format)                                                                     blogs#show
#                                       PATCH  /blogs/:id(.:format)                                                                     blogs#update
#                                       PUT    /blogs/:id(.:format)                                                                     blogs#update
#                                       DELETE /blogs/:id(.:format)                                                                     blogs#destroy
#                                  root GET    /                                                                                        pages#home
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  root to: "pages#home"
end
