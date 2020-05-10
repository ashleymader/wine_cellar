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

end
