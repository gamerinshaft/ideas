class Theme < ActiveRecord::Base
  has_many :ideas
  # follow
  belongs_to :b_material, :class_name => 'Material', :foreign_key => :a_material_id

  # followed
  belongs_to :a_material, :class_name => 'Material', :foreign_key => :b_material_id

end
