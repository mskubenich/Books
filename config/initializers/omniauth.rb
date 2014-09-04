Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '894150267279528', '202be0a5aa35be986819737b6f677256'
  provider :twitter, 'AwDEAgrzywx7BYSou6kWbO9aC', 'FPctBjILgQXeDoQe986keCxzsHc5Qlswp4qC5UKk4phRaAsJKR'
end