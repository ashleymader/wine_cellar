class Wine < ActiveRecord::Base

    has_many :users, through: :user_wines 
    has_many :user_wines
end
