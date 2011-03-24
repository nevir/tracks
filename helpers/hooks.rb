class << self
  def after_bundle(&block)
    @after_bundle_blocks ||= []
    @after_bundle_blocks << block
  end
  
  def execute_after_bundle
    @after_bundle_blocks ||= []
    @after_bundle_blocks.each do |block|
      block.call
    end
  end
end
