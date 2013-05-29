class ArrayDiff
  attr_reader :one, :two

  def initialize one, two
    @one, @two = one.to_a, two.to_a
  end

  def deletions
    one_dup = one.clone
    two.each { |x| one_dup.slice!(one_dup.index(x)) if one_dup.index(x) }
    one_dup
  end

  def additions
    two_dup = two.clone
    one.each { |x| two_dup.slice!(two_dup.index(x)) if two_dup.index(x) }
    two_dup
  end
end
