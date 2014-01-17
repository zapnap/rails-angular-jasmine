RailsAngularJasmine::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  scope '/api', module: :api, defaults: { format: :json } do
    resources :tasks
  end

  root 'pages#home'
end
