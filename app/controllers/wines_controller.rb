class WinesController <ApplicationController 


    get '/wines' do 
        @wines = Wine.all 
        erb :"/wines/index"
    end

    get '/wines/:id' do 
        @wine = Wine.find(params[:id])
        erb :"/wines/show"
    end

  


end