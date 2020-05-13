class Wine < ActiveRecord::Base

    has_many :users, through: :user_wines 
    has_many :user_wines

    # validates :w_type, :vintage, :varietal, :producer, presence: true
end
