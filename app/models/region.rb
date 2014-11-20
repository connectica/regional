class Region < ActiveRecord::Base
  has_ancestry orphan_strategy: :destroy

  before_save :cache_ancestry

  def cache_ancestry
    self.names_depth_cache = path.map(&:name).join('/')
  end
end