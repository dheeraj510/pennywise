Pennywise::Application.routes.draw do
  root to: "home#index"

  scope constraints: { id: /[0-9]+/ } do
    resources :items
  end
end
