Rails.application.routes.draw do
  
  get 'room_numbers/new'
  get 'room_numbers/create'
  resources :chambres do
    get 'fiche',on: :member
  end

  resources :docteurs do
    get 'fiche',on: :member
    resources :absences, only: [:create, :destroy]
  end

  resources :absences do
    get 'fiche',on: :member
    resources :absences, only: [:destroy, :create]
  end

  resources :patients do
    get 'fiche',on: :member
    resources :absences, only: [:destroy]

  end

  resources :specialites do
    get 'fiche',on: :member
  end
  #get 'specialites/choose_specialites', to: 'specialites#choose_specialites', as: 'choose_specialites'

  resources :room_numbers do
    get 'fiche',on: :member
  end

  resources :chambres do
    get 'unavailable_dates', on: :member
  end

  

  root to: 'pages#home'
  
  

end
