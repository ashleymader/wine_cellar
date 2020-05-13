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

    get '/user_wines/:id' do 
        @wines = UserWine.find_by_id(params[:user_id])
        erb :"/user_wines/show"
    end

    post '/user_wines' do 
        new_wine = UserWine.create(wine_id: params[:wine][:wine_id], user_id: current_user.id)
        binding.pry
    end
end