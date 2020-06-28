class UserWinesController <ApplicationController 

    #create
      

    #read 
    get '/user_wines' do
        @uw = current_user.user_wines
        erb :"/user_wines/index"
    end

    get '/user_wines/new' do 
        @wines = Wine.all
        erb :"user_wines/new"
    end

    post '/user_wines' do 
        new_wine = UserWine.create(wine_id: params[:wine][:wine_id], user_id: current_user.id, notes: params[:user_wine][:notes])
        @uw = current_user.user_wines
        
        redirect "/user_wines"
    end

    get '/user_wines/edit' do 
        # @uw = current_user.user_wines
        @uw = UserWine.where({user_id: "#{current_user.id}"})
        erb :"user_wines/edit"
        # binding.pry
    end

    patch '/user_wines' do 
        @uw = UserWine.where({user_id: "#{current_user.id}"})
        @uw.update (notes: params[:notes])
        redirect '/user_wines'
    end



end