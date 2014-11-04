class Region < ActiveRecord::Base
  has_ancestry orphan_strategy: :destroy

end