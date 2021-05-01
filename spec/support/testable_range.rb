module TestableRange
  #
  # @param range [Array]
  # @return [Array]
  #
  # :reek:UtilityFunction
  def two_of_array_of_string(arr)
    [arr.first.to_s, arr.last.to_s]
  end
end
