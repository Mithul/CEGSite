 	GCM.host = 'https://android.googleapis.com/gcm/send'
    # https://android.googleapis.com/gcm/send is default

    GCM.format = :json
    # :json is default and only available at the moment

    GCM.key = RAILS_ENV['GCM_key']
    # this is the apiKey obtained from here https://code.google.com/apis/console/

configatron.gcm_on_rails.api_url = 'https://android.googleapis.com/gcm/send'
configatron.gcm_on_rails.api_key = RAILS_ENV['GCM_key']
configatron.gcm_on_rails.app_name = 'com.example.edwin.ceg'
configatron.gcm_on_rails.delivery_format = 'json'