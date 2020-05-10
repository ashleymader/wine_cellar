class UsersController <ApplicationController 

    #render my login form for a user 
    get '/login' do 
        erb :'users/login'
    end

    #recieving params from users/login.erb
    post '/login' do 
        #find user 
        user = User.find_by(email: params[:email])
        #authenticate user 
        # we add if user && because if email isn't found (mistype or whatever, it won't return nil on user. it will just redirect to login page again)
        if user && user.authenticate(params[:password])
            binding.pry
        #login user 
        session[:user_id] = user.id
        #redirect to the user/show page
        else  
        #redirect to login or register 
            redirect '/login'
        end
    end
    
end