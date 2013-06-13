RfLocations::Application.routes.draw do

  resources :categories, only: [ :index, :show ] do
    resources :locations, only: [ :index, :show ]
  end
  resources :locations, only: [ :index, :show ]

end
