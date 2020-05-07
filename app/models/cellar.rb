class Cellar <ActiveRecord::Base
    belongs_to :user
    belongs_to :wines
end