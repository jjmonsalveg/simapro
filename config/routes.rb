Myapp::Application.routes.draw do


  # You can have the root of your site routed with "root"
  root to: 'static#index'

  resources :especies do
    get 'asignar_usos', to: :wf_asignar_usos, as: :asignar_usos, on: :collection
    member do
      get 'ajax_uso', to: :ajax_especie_usos, as: :ajax_usos
      post 'crear_usos', to: :wf_crear_usos, as: :crear_usos
    end
  end
  resources :grupo_especies

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

  scope module: 'users' do
    resources :client_users
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
    post 'cuenca/:bo/subcuenca', to: 'unidad_manejos#create'
    get 'cuenca/:bo/subcuenca', to: 'unidad_manejos#new', as: :unidad_manejo_new
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

  get 'mediciones_inventario_estatico', to: 'mediciones_inventario#wf_estatico', as: :mediciones_inventario_estatico
  post 'mediciones_inventario_estatico/select_parcela_inventario', to: 'mediciones_inventario#wf_select_parcela_inventario'
  post 'mediciones_inventario_estatico/load_form', to: 'mediciones_inventario#wf_load_form'
  post 'mediciones_inventario_estatico/save', to: 'mediciones_inventario#wf_save_estatico', as: :mediciones_inventario_save_estatico, defaults: { format: 'json' }
  post 'mediciones_inventario_estatico/load_tipo_parcela', to: 'mediciones_inventario#wf_load_form_tipo_parcela'
  
  
  namespace :dynamic_select do
    get ':bo/subcuencas', to: 'dynamic_subcuencas#index', as: :dynamic_subcuencas
    get ':reserva_forestal_id/unidad_ordenacion', to: 'dynamic_unidad_ordenacion#index', as: :dynamic_unidad_ordenacion
  end



end
