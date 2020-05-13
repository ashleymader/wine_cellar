class UserWinesController <ApplicationController 

    #create

    #read 
    get '/user_wines' do
        @wines = current_user.wines
        erb :"/user_wines/index"
    end

    get '/user_wines/new' do 
        @wines = Wine.all
        @notes = UserWine.notes
        erb :"user_wines/new"
    end

    get '/wines/:id' do 
        @wines = Wine.find(params[:id])
        erb :"/wines/show"
    end

    post '/user_wines' do 
        new_wine = UserWine.create(wine_id: params[:wine][:wine_id], user_id: current_user.id)
        redirect "/user_wines"
    end
end