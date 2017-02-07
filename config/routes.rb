Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :schedules
      resources :shows
      resources :channels
      resources :categories
    end
  end

  root 'demo#schedule'
  match '*path', to: 'error#catch_404', via: :all
end
