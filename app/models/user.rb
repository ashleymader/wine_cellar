class User < ActiveRecord::Base
    has_secure_password
    validates :name, :image_url, :email, presence: true
    validates :email, uniqueness: true

    has_many :wines, through: :user_wines 
    has_many :user_wines, dependent: :destroy

end
