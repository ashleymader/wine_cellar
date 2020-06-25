class UserWinesController <ApplicationController 

    #create
      

    #read 
    get '/user_wines' do
        @wines = current_user.wines
        erb :"/user_wines/index"
    end

    get '/user_wines/new' do 
        @wines = Wine.all
        erb :"user_wines/new"
    end

    post '/user_wines' do 
        new_wine = UserWine.create(wine_id: params[:wine][:wine_id], user_id: current_user.id, notes: params[:userwine][:notes])
        redirect "/user_wines"
    end

    


end