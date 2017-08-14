Rails.application.routes.draw do
  root 'main#mainmenu'
  get '/quote'    , to: 'main#quoteform'
  get '/location' , to: 'main#locationpage'
  get '/slg'      , to: 'main#slgpage'
  get '/addinfo'  , to: 'main#addinfo'
end
