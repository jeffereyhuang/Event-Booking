OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,'914920466925-iru3o8sricq2s1733nn5qrfef51av0c0.apps.googleusercontent.com', 'WzuAZdOIFZBunGND60vBfVTl',
  {:client_options => { :ssl => { :verify => !Rails.env.development? }}, scope: 'profile', :image_aspect_ratio => "square",
      :image_size => 50}
end
