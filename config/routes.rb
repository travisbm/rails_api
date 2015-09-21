Rails.application.routes.draw do
root 'users#index'


  resources :users        #     users GET    /users(.:format)          users#index
                          #           POST   /users(.:format)          users#create
                          #  new_user GET    /users/new(.:format)      users#new
                          # edit_user GET    /users/:id/edit(.:format) users#edit
                          #      user GET    /users/:id(.:format)      users#show
                          #           PATCH  /users/:id(.:format)      users#update
                          #           PUT    /users/:id(.:format)      users#update
                          #           DELETE /users/:id(.:format)      users#destroy

  resources :addresses    #   addresses GET    /addresses(.:format)          addresses#index
                          #              POST   /addresses(.:format)          addresses#create
                          #  new_address GET    /addresses/new(.:format)      addresses#new
                          # edit_address GET    /addresses/:id/edit(.:format) addresses#edit
                          #      address GET    /addresses/:id(.:format)      addresses#show
                          #              PATCH  /addresses/:id(.:format)      addresses#update
                          #              PUT    /addresses/:id(.:format)      addresses#update
                          #              DELETE /addresses/:id(.:format)      addresses#destroy

  resources :items        # items GET    /items(.:format)              items#index
                          #              POST   /items(.:format)              items#create
                          #     new_item GET    /items/new(.:format)          items#new
                          #    edit_item GET    /items/:id/edit(.:format)     items#edit
                          #         item GET    /items/:id(.:format)          items#show
                          #              PATCH  /items/:id(.:format)          items#update
                          #              PUT    /items/:id(.:format)          items#update
                          #              DELETE /items/:id(.:format)          items#destroy

  resources :orders       # orders GET    /orders(.:format)             orders#index
                          #              POST   /orders(.:format)             orders#create
                          #    new_order GET    /orders/new(.:format)         orders#new
                          #   edit_order GET    /orders/:id/edit(.:format)    orders#edit
                          #        order GET    /orders/:id(.:format)         orders#show
                          #              PATCH  /orders/:id(.:format)         orders#update
                          #              PUT    /orders/:id(.:format)         orders#update
                          #              DELETE /orders/:id(.:format)         orders#destroy
end
