# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_devise_template_session',
  :secret      => 'e2dffef5e30916635ca7065c509cbddad9ed1e316e10a17fbc0b63251f15a8f03ce170f9b39715217654dc19b5ef253ae4bc7edb5d5fe11756aa0d763af5650c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
