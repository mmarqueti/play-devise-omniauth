class Authentication < ActiveRecord::Base
  belongs_to :user
  
  def provider_name
    if provider == 'open_id'
      "OpenID"
    else
      provider.titleize
    end
  end
  
  def get_twitter_token
    prepare_access_token_twitter(self.token, self.secret)
  end
  
  def get_facebook_token
    prepare_access_token_facebook(self.token, self.secret)
  end
  
  # prepare token for twitter oauth
  def prepare_access_token_twitter(oauth_token, oauth_token_secret)
      consumer = OAuth::Consumer.new(ENV['TW_KEY'], ENV['TW_SECRET'], { 
        :site => "http://api.twitter.com" 
        }
      )
      # now create the access token object from passed values
      token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
      return access_token
  end
  
  # prepare token for facebook oauth
  def prepare_access_token_facebook(oauth_token, oauth_token_secret)
    require 'oauth2'

    client = OAuth2::Client.new(ENV['FB_KEY'], ENV['FB_SECRET'], :site => 'https://graph.facebook.com')

    # token api explorer 145634995501895|2.AQDBDSIwZiJe83u3.3600.1313006400.1-732449366|UKy7KgpIU0fSXfZ6yqj2kTTY31g

    access_token = OAuth2::AccessToken.new client, oauth_token
    return access_token
  end
  
  
end
