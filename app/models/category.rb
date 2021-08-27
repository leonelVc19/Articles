class Category < ApplicationRecord
    has_many :has_categories, :dependent => :destroy
    has_many :articles, :dependent => :destroy, through: :has_categories

end
