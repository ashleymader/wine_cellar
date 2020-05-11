require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable sessions and allow it to be inherited to all other controller (so we can track across pages)
    enable :sessions
    #set a secret session for security. Always name it something not obvious
    set :session_secret, "i_feel_so_smart_right_now"

  end

  get "/" do
    erb :welcome
  end
  
  helpers do

    #boolean for if user is logged in 
    def logged_in?
      !!current_user
    end

    # tracks use across site 
    def current_user
      User.find_by(id: session[:user_id])
    end

    # create an authorization helper for edit/delete
    def authorized_to_edit?(userwine)
      userwine.user_id == current_user.id
    end

  end
end
