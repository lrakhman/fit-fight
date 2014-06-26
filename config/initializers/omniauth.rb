Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '2f490eb8444c48c1a3e5a3aa738c5018', '01c8682329934edba0f407d27d0494d8'
end