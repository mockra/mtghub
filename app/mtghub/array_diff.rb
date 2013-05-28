class ArrayDiff
  attr_reader :one, :two

  def initialize one, two
    @one, @two = one, two
  end

  def deletions
    one_dup = one.dup
    two.each { |x| one_dup.slice!(one_dup.index(x)) if one_dup.index(x) }
    one_dup
  end

  def additions
    two_dup = two.dup
    one.each { |x| two_dup.slice!(two_dup.index(x)) if two_dup.index(x) }
    two_dup
  end
end
