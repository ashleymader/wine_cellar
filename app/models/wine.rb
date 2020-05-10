class Wine < ActiveRecord::Base

    has_many :users, through: :userwines 
    has_many :userwines
end
