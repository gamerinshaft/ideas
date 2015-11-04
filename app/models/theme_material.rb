class ThemeMaterial < ActiveRecord::Base
  belongs_to :theme
  belongs_to :material
  validates :theme_id, :uniqueness => {:scope => :material_id}
end
