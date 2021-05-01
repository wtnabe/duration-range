module TestableRange
  #
  # @param range [Array]
  # @return [Array]
  #
  # :reek:UtilityFunction
  def two_of_array_of_string(arr)
    [arr.first.to_s, arr.last.to_s]
  end

  #
  # @param hash [Hash]
  # @return [Hash]
  #
  # :reek:UtilityFunction
  def stringified_hash(hash)
    hash.map { |key, value| [key, value.to_s] }.to_h
  end
end
