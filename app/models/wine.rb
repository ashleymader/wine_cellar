class Wine < ActiveRecord::Base
    belongs_to :cellar
    belongs_to :user, through: :cellars
end
