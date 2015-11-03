class Theme < ActiveRecord::Base
  has_many :ideas
  belongs_to :a_material, :class_name => 'Material'
  belongs_to :b_material, :class_name => 'Material'
end
