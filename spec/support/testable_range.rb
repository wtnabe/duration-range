module TestableRange
  #
  # @param range [Range]
  # @return [Array]
  #
  # :reek:UtilityFunction
  def to_array_of_string(range)
    arr = range.to_a
    [arr.first.to_s, arr.last.to_s]
  end
end
