class WinesController <ApplicationController 


    get '/wines' do 
        authentication_required 
        @wines = Wine.all 
        erb :"/wines/index"
    end

    get '/wines/:id' do 
        authentication_required 
        @wine = Wine.find(params[:id])
        erb :"/wines/show"
    end

  


end