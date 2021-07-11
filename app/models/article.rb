class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #va en el campo adicional article le pertenece a users
    
end
