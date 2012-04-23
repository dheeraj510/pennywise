Pennywise::Application.routes.draw do
  root to: "home#index"

  scope constraints: { id: /[0-9]+/ } do
    resources :items

    scope constraints: { item_id: /[0-9]+/ },
           controller: :transaction_entries,
                 path: "/items/:item_id/transactions" do
      get "/" => :index, as: :item_transactions
      get "/new" => :new, as: :new_item_transaction
      post "/" => :create, as: :create_item_transaction
      get "/:id" => :show, as: :item_transaction
      get "/:id/edit" => :edit, as: :edit_item_transaction
      put "/:id" => :update, as: :update_item_transaction
      delete "/:id" => :destroy, as: :destroy_item_transaction
    end
  end
end
