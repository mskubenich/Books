Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '894150267279528', '202be0a5aa35be986819737b6f677256'
  provider :twitter, 'AwDEAgrzywx7BYSou6kWbO9aC', 'FPctBjILgQXeDoQe986keCxzsHc5Qlswp4qC5UKk4phRaAsJKR'
  provider :google_oauth2, '148570660203-f72g9oq0urhb9mcl8hlqpq4vddk6v5dd.apps.googleusercontent.com', 'pDK_UtzjfiB4WFRuUImYbfpU'
  provider :github, 'c0f322e8fbc0e9e52165', '6b898de342d4d8d7fed0cf3ef63d629e3320ebb1'
  provider :vkontakte, '4538108 ', 'FvqFpX9y6pcqF5ltp3oQ'
end