class Material < ActiveRecord::Base
  has_many :inputs
  has_many :themes, through: :inputs
  validates :name, uniqueness: true
end
