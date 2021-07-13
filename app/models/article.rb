class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #va en el campo adicional article le pertenece a users
    has_many :has_categories
    has_many :categories, through: :has_categories
    attr_accessor :category_elments

    def save_categories
        #category_elments 1,2,3
        #Convertir eso en un arreglo 1,2,3 =>[1,2,3]
        categories_array = category_elments.split(",")
        #Iterar ese areglo
        categories_array.each do |category_id|
            #Crear HasCategory HasCategory<article_id: 1, category_id: category_id
            HasCategory.create(article: self, category_id: category_id)
        end
    end

end
