Myapp::Application.routes.draw do


  # You can have the root of your site routed with "root"
  root to: 'static#index'

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  

  devise_scope :user do
    get 'users/new', to: 'users/registrations#new_user'
    post 'users/create_user',
         to: 'users/registrations#create_user'
    get 'user/show/:id', to: 'users/registrations#show', as: :user_show
    get 'users/index', to: 'users/registrations#index'
    get 'users/edit_user/:id', to: 'users/registrations#edit_user', as: :user_edit_user
    post 'users/update_user', to: 'users/registrations#update_user'
    delete 'users/delete_user/:id', to: 'users/registrations#delete_user', as: :user_delete_user
    get 'profile', to: 'users/profiles#profile'
    get 'profile/edit', to: 'users/profiles#edit'
    post 'profile/update', to: 'users/profiles#update'
  end

  resources :roles

  resources :empresas_forestales

  resources :paises, except: :show

  resources :jquery_file_uploads, only: [:create, :destroy, :index] do
    member do
      delete 'wf_destroy_no_paginado'
    end
  end

  namespace :unidad_ordenacion do
    get 'cuencas', to: 'bloque_ordenacions#index', as: :bloque_ordenacions
    get 'cuencas/nueva', to: 'bloque_ordenacions#new', as: :bloque_ordenacion_new
    post 'cuencas', to: 'bloque_ordenacions#create'
    get 'cuencas/:id/editar', to: 'bloque_ordenacions#edit', as: :bloque_ordenacion_edit
    put 'cuencas/:id/update', to: 'bloque_ordenacions#update', as: :bloque_ordenacion
    patch 'cuencas/:id/update', to: 'bloque_ordenacions#update'
    delete 'cuenca/:id', to: 'bloque_ordenacions#destroy', as: :bloque_ordenacion_destroy
  end


end
