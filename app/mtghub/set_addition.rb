class SetAddition
  attr_reader :title, :code, :block_title

  def initialize title, code, block_title=nil
    @title, @code, @block_title = title, code, block_title
  end

  def process
    create_block if block_title
    create_set
    collect_set
  end

  def create_set
    if block_title
      block.mtg_sets.create title: title, code: code
    else
      MtgSet.create title: title, code: code
    end
  end

  def create_block
    MtgBlock.create(title: block) if !block
  end

  def collect_set
    CardsFromSet.new(title).generate
  end

  def block
    MtgBlock.find_by_title block_title
  end
end
