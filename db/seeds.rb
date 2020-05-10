#this is where I will write the seed data for my program 
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)
ashley = User.create(name: "Ashley", email: "ashley@ashley.com", password: "pw", image_url: "https://images.app.goo.gl/zrPRXKw3nQEiyQeW7")

nick = User.create(name: "Nick", email: "nick@nick.com", password: "pw", image_url: "https://images.app.goo.gl/SDiSi6iKe5yoiU4q7") 

UserWine.create(user_id: nick.id, wine_id: wine1, notes: "this wine is terrible")
UserWine.create(user_id: nick.id, wine_id: wine2, notes: "the best, ever!")
UserWine.create(user_id: ashley.id, wine_id: wine3, notes: "I really just like any dry red wine so it doesn't matter")

wine1 = Wine.create(w_type: "Red", vintage: "2013", varietal: "Cabernet Sauvignon", producer: "14 Hands")

wine2 = Wine.create(w_type: "White", vintage: "2016", varietal: "Sauvignon Blanc", producer: "Beringer Vineyards")

wine3 = Wine.create(w_type: "Red", vintage: "2003", varietal: "Chianti", producer: "Colle Bereto")