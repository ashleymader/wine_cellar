class User < ActiveRecord::Base
    has_secure_password

    has_many :wines, through: :user_wines 
    has_many :user_wines, dependent: :destroy

end
