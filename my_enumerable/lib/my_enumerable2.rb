# Rebuild of the Enumerable methods

module Enumerable
  
  def my_each
    return self unless block_given?
    i = 0
    while i < self.length do
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < self.length do
        yield(self[i], i)
        i += 1
      end
    end
  end