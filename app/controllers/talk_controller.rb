class TalkController < ApplicationController

  def twitter

      content = 'No Twitter authentications for you'
      auth = current_user.authentications.find(:first, :conditions => { :provider => 'twitter' })

      # get the rigth token
      if auth
        access_token = auth.get_twitter_token

        # use the access token as an agent to get my infos
        response = access_token.request(:get, "http://api.twitter.com/1/users/show.json?screen_name=bondix")
        content = response.body
      end
      
      render :text => content
  end


  def facebook
    
    content = 'No Facebook authentications for you'
    
    auth = current_user.authentications.find(:first, :conditions => { :provider => 'facebook' })

    if auth
      # get the rigth token
      access_token = auth.get_facebook_token

      # use the access token as an agent to get the home timeline
      content = access_token.get('/97070757020')
    end

    render :text => content
  end

end
