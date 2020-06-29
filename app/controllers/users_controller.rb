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
        #flash to show success for logged in 
            flash[:message] = "Welcome back #{user.name}"
        #redirect to the user/show page
            redirect "/users/#{user.id}"
        else  
        #redirect to login or register 
            flash[:error] = "Username or password is incorrect."
            redirect "/login"
        end
    end

    #finding by id, sending to show page
    get '/users/:id' do 
        authentication_required 
        if  !authorized_to_view(params[:id]) 
            flash[:error] = "You may only view your profile"
            redirect '/'
        else 
            @user = User.find_by_id(params[:id])
            erb :"users/show" 
        end
    end


    get '/signup' do
        erb :"users/signup"
    end
    
    post '/users' do 
        #takes in params defined in the form and makes a new user
        # @user = User.new(params)
        @user = User.new(name: params[:name], email: params[:email], image_url: params[:image_url], password: params[:password])
        if @user.save
            #just like with sign in we need to set a session k/v pair to follow user through the site. 
            session[:user_id] = @user.id
            #welcome flash
            flash[:message] = "Welcome to Virtual Wine Cellar, #{@user.name}!"
            #now we rediect the user to their profile page 
            redirect "/users/#{@user.id}"
        else 
            flash[:error] = "Account creation failed.  #{@user.errors.full_messages.to_sentence}."
            redirect '/signup'
        end
    end

    get '/logout' do 
        session.clear 
        redirect '/'
    end
    
end