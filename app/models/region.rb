class Region < ActiveRecord::Base
  has_ancestry orphan_strategy: :destroy, cache_depth: true

  before_save :cache_ancestry

  def cache_ancestry
    self.names_depth_cache = path.map(&:name).join('/')
  end
end