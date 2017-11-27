Kms::Gallery::Engine.routes.draw do
  constraints(format: "json") do
    resources :galleries do
      member do
        post '' => 'galleries#update'
        post '/pictures' => "galleries#pictures_create"
      end
      collection do
        delete '/pictures/:id' => "galleries#picture_destroy"
      end
    end
  end
end
  
