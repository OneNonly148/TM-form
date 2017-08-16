Rails.application.routes.draw do
  root 'main#mainmenu'
  get '/quote'    , to: 'main#quoteform'
  get '/location' , to: 'main#quoteform2'
  get '/slg'      , to: 'main#slgpage'
  get '/addinfo'  , to: 'main#addinfo'
  get '/load_state', to: 'main#load_state'
  get '/load_loc', to: 'main#load_loc'
  get '/load_UPE', to: 'main#load_UPE'
end
