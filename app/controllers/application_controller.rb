require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable sessions and allow it to be inherited to all other controller (so we can track across pages)
    enable :sessions
    #set a secret session for security. Always name it something not obvious
    set :session_secret, "i_feel_so_smart_right_now"
    #registering the flash gem to enable use
    register Sinatra::Flash
  end

  get "/" do
    if logged_in? 
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end
  
  helpers do

    #boolean for if user is logged in. Hard truthy or falsey value 
    def logged_in?
      !!current_user
    end

    # tracks use across site 
    def current_user
      @user ||= User.find_by(id: session[:user_id])
      #limits calls to db by checking to see if @user has a value first and then will query db. 
    end

    # create an authorization helper for viewing profiles
    
    def authorized_to_view(id)
        id.to_i == current_user.id 
    end

    def authentication_required
      if !logged_in?        
        flash[:error] = "You must be logged in to view website."
        redirect '/'
      end
    end

  end
end
