#this is where I will write the seed data for my program 
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)
ashley = User.create(name: "Ashley", email: "ashley@ashley.com", password: "pw", image_url: "https://images.app.goo.gl/zrPRXKw3nQEiyQeW7")

nick = User.create(name: "Nick", email: "nick@nick.com", password: "pw", image_url: "https://images.app.goo.gl/SDiSi6iKe5yoiU4q7") 

Wine.create(w_type: "Red", quantity: 4, vintage: "2013", varietal: "Cabernet Sauvignon", producer: "14 Hands", user_id: ashley.id )

Wine.create(w_type: "White", quantity: 2, vintage: "2016", varietal: "Sauvignon Blanc", producer: "Beringer Vineyards", user_id: nick.id )

Wine.create(w_type: "Red", quantity: 1, vintage: "2003", varietal: "Chianti", producer: "Colle Bereto", user_id: nick.id )