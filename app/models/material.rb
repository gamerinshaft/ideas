class Material < ActiveRecord::Base
  has_many :theme_materials
  has_many :themes, through: :theme_materials
end
