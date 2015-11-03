class Material < ActiveRecord::Base
  # follow
  has_many :b_material, :class_name => 'Theme', :foreign_key => :a_material_id, :dependent => :destroy

  # followed
  has_many :a_material, :class_name => 'Theme', :foreign_key => :b_material_id, :dependent => :destroy # 関連名(:followerships)とクラス名(Friendship)が異なっているので、:class_nameでクラス名を指定。foreign_key は:friend_idを使う。

end
