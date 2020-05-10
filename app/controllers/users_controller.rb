class UsersController <ApplicationController 

    #render my login form for a user 
    get "/login" do 
        erb :'users/login'
    end

    #recieving params from users/login.erb
    post "/login" do 
        #find user 
        user = User.find_by(email: params[:email])
        #authenticate user 
        # we add if user && because if email isn't found (mistype or whatever, it won't return nil on user. it will just redirect to login page again)
        if user && user.authenticate(params[:password])
        #creating a session key/value pair for user to login. Setting key in session to user_id and then assigning the value to the users id. 
            session[:user_id] = user.id
        #redirect to the user/show page
            redirect "/users/#{user.id}"
        else  
        #redirect to login or register 
            # flash[:error] = "Oops! Looks like you entered something wrong."
            redirect "/login"
        end
    end

    get '/users/:id' do 
        # user = User.find_by_id(params[:id])
        "show user page"
    end
    
end