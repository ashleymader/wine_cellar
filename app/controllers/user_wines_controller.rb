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

    get '/user_wines/:id/edit' do 
        @user_wine = UserWine.find(params[:id])
        erb :"user_wines/edit"
        
    end

    patch '/user_wines/:id' do 
        @user_wine = UserWine.find(params[:id])       
        @user_wine.update(notes: params[:user_wine][:notes])
        flash[:message] = "Note Updated Successfully"
        redirect '/user_wines'
    end

    delete '/user_wines/:id' do 
        @user_wine = UserWine.find(params[:id])
        @user_wine.destroy
        flash[:message] = "Deleted Wine Successfully"
        redirect '/user_wines'
    end

end