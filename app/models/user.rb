class User < ActiveRecord::Base
    has_secure_password

    has_many :wines, through: :userwines 
    has_many :userwines
end
