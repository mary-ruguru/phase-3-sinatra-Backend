class User  < ActiveRecord::Base
    has_many :recipes, through: :categories
    
end