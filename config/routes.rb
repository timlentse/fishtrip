Rails.application.routes.draw do
  root 'commons#index'

  # Router for fishtrip
  get '/fishtrip//search/'=>'fishtrips#query_by_get'
  post '/fishtrip/search/'=>'fishtrips#query_by_post'
  get '/fishtrip/:id/'=>'fishtrips#detail', id: /\d+/
  get '/fishtrip/articles/:article_id/'=>'fishtrips#articles', article_id: /\d{4}/
  get '/fishtrip/:country/'=>'fishtrips#country', country: /[a-zA-Z_]+/
  get '/fishtrip/:country/:city_en/'=>'fishtrips#city_list_by_get'
  post '/fishtrip/:country/:city_en/'=>'fishtrips#city_list_by_post'

  # Router for booking
  get '/booking/:country/'=>'bookings#country', country: /[a-z]{2}/
  get '/booking/:country/:city_unique/'=>'bookings#city_list_by_get', country: /[a-z]{2}/, city_unique: /[a-z\-\d]+/
  post '/booking/:country/:city_unique/'=>'bookings#city_list_by_post', country: /[a-z]{2}/, city_unique: /[a-z\-\d]+/
  get '/booking/landmark/:id/'=>'bookings#landmark', id: /\d+/
  get '/booking/airport/:iata/'=>'bookings#airport', iata: /[a-z]{3}/
  get '/booking/:id'=>'bookings#detail',id:/\d+/

  # Router for booking review
  get '/booking/:country/:city_unique/review.html'=>'bookings#city_review', country: /[a-z]{2}/, city_unique: /[a-z\-\d]+/

  # Router for clock hotels
  get '/clockhotel/:city_name_en/'=>'clock_hotels#list', city_name_en: /[A-Za-z_]+/
  get '/clockhotel/:id/'=>'clock_hotels#detail',:id=>/\d+/
end
