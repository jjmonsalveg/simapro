Myapp::Application.routes.draw do


  # You can have the root of your site routed with "root"
  root to: 'static#index'

  resources :especies

  resources :unidad_ordenaciones

  resources :reserva_forestales


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

    get 'ajustes', to: 'users/settings#index', as: :settings
    post 'save_subcuenca', to: 'users/settings#save_subcuenca'
  end

  resources :roles

  #TODO clean this
  #------------------JJ-don't touch bitch------------------------------
  resources :empresas_forestales
  resources :zonas_ordenamiento
  resources :paises, except: :show

  resources :jquery_file_uploads, only: [:create, :destroy, :index] do
    member do
      delete 'wf_destroy_no_paginado'
    end
  end
 #-----------------------------------------------------------------------
  namespace :unidad_ordenacion do

    #BLOQUES DE ORDENACION
    get 'cuencas', to: 'bloque_ordenacions#index', as: :bloque_ordenacions
    get 'cuencas/nueva', to: 'bloque_ordenacions#new', as: :bloque_ordenacion_new
    post 'cuencas', to: 'bloque_ordenacions#create'
    get 'cuencas/:id/editar', to: 'bloque_ordenacions#edit', as: :bloque_ordenacion_edit
    put 'cuencas/:id/update', to: 'bloque_ordenacions#update', as: :bloque_ordenacion
    patch 'cuencas/:id/update', to: 'bloque_ordenacions#update'
    delete 'cuenca/:id', to: 'bloque_ordenacions#destroy', as: :bloque_ordenacion_destroy
    get 'cuenca/:id', to: 'bloque_ordenacions#show', as: :bloque_ordenacion_show

    #UNIDADES DE MANEJO
    get 'cuenca/:bo/subcuencas', to: 'unidad_manejos#index', as: :unidad_manejos
    post 'cuenca/:bo/subcuencas', to: 'unidad_manejos#create'
    get 'cuenca/:bo/subcuenca/nueva', to: 'unidad_manejos#new', as: :unidad_manejo_new
    get 'cuenca/:bo/subcuenca/:id/ver', to: 'unidad_manejos#show', as: :unidad_manejo_show
    get 'cuenca/:bo/subcuenca/:id', to: 'unidad_manejos#edit', as: :unidad_manejo_edit
    put 'cuenca/:bo/subcuenca/:id', to: 'unidad_manejos#update', as: :unidad_manejo
    patch 'cuenca/:bo/subcuenca/:id', to: 'unidad_manejos#update'
    delete 'cuenca/:bo/subcuenca/:id', to: 'unidad_manejos#destroy', as: :unidad_manejo_destroy

    get 'subcuencas', to: 'unidad_manejos#index_all', as: :unidad_manejos_all
    get 'subcuenca/nueva', to: 'unidad_manejos#new_all', as: :unidad_manejo_new_all
    post 'subcuenca/nueva', to: 'unidad_manejos#create_all'

    #BLOQUES DE MANEJO
    resources :bloque_manejos

  end
  
  
  namespace :dynamic_select do
    get ':bo/subcuencas', to: 'dynamic_subcuencas#index', as: :dynamic_subcuencas
  end



end
