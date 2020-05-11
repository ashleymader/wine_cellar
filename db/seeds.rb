#this is where I will write the seed data for my program 
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)
ashley = User.create(name: "Ashley", email: "ashley@ashley.com", password: "pw", image_url: "https://pixabay.com/images/id-4520513/")
nick = User.create(name: "Nick", email: "nick@nick.com", password: "pw", image_url: "https://pixabay.com/images/id-1652455/") 

wine1 = Wine.create(w_type: "Red", vintage: "2013", varietal: "Cabernet Sauvignon", producer: "14 Hands")
wine2 = Wine.create(w_type: "White", vintage: "2016", varietal: "Sauvignon Blanc", producer: "Beringer Vineyards")
wine3 = Wine.create(w_type: "Red", vintage: "2003", varietal: "Chianti", producer: "Colle Bereto")

userwine1 =UserWine.create(user_id: nick.id, wine_id: wine1.id, notes: "this wine is terrible")
userwine2 = UserWine.create(user_id: nick.id, wine_id: wine2.id, notes: "the best, ever!")
userwine3= UserWine.create(user_id: ashley.id, wine_id: wine3.id, notes: "I really just like any dry red wine so it doesn't matter")
