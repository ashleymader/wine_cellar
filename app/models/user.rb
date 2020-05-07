class User <ActiveRecord::Base
    has_secure_password

    has_many :wines, through: :cellars
    has_many :cellars 

end