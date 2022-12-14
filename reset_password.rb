 # removes admin rights from user
  delete 'admin/:authentication_token/users/admin_user' => 'admin/admin_users#destroy', defaults: {format: :json}

  # resends confirmation email
  post 'admin/:authentication_token/users/confirm' => 'admin/confirmation_emails#create', defaults: {format: :json}

  as :user do
    # registration
    post '/users' => 'registrations#create', as: 'user_registration', defaults: {format: :json}

    # session creation
    post '/sessions' => 'devise/sessions#create', as: 'user_session', defaults: {format: :json}

    # password reset email
    # send password reset email
    post '/users/password' => 'devise/passwords#create', as: 'user_password', defaults: {format: :json}

    # reset user password
