class WinesController <ApplicationController 

    #create

    #read 
    get '/wines' do 
        # if UserWine.user_id == current_user
            @wines = Wine.all
        erb :"/wines/index"
    end

    get '/wines/new' do 
        erb :"wines/new"
    end

    get '/wines/:id' do 
        @wines = UserWine.find_by_id(params[:id])
        erb :"/wines/show"
    end

    post 'wines' do 
        Wine.create(params)
        redirect "/wines"
    end
end