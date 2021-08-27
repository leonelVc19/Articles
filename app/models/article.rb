class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #va en el campo adicional article le pertenece a users
    has_many :has_categories, :dependent => :destroy
    has_many :categories, :dependent => :destroy, through: :has_categories
    attr_accessor :category_elements

    def save_categories
        #category_elments 1,2,3
       
        #Iterar ese areglo
        return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

        has_categories.where.not(category_id: category_elements).destroy_all

        category_elements.each do |category_id|
            #Crear HasCategory HasCategory<article_id: 1, category_id: category_id
                HasCategory.find_or_create_by(article: self, category_id: category_id)
        end
    end
end
