Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/schedules/search', to: 'schedules#search'
      resources :schedules, only: [:show, :index]
      resources :shows, only: [:show, :index]
      resources :channels, only: [:show, :index]
      resources :categories, only: [:show, :index]
    end
  end

  root 'demo#schedule'
  match '*path', to: 'error#catch_404', via: :all
end
