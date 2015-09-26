KmsGallery::Engine.routes.draw do
  resources :galleries do
    member do
      post '' => 'galleries#update'
    end
  end
end
