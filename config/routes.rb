Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :feedback_reviews
    resources :reviews do
      member do
        get :approve
      end
      resources :feedback_reviews
    end
    resource :review_settings
  end

  namespace :products do
    resources :reviews do
      collection do
        get :terms
        get "submissionguidelines"
      end
    end
  end
  post "/reviews/:review_id/feedback(.:format)" => "feedback_reviews#create"
end
