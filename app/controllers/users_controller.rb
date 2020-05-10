class UsersController <ApplicationController 

    #render my login form for a user 
    get '/login' do 
        erb :"users/login"
    end

    
end