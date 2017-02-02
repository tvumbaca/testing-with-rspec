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

  def my_select
    return self if self.empty?
    if block_given?
      arr = []
      self.my_each { |num| yield(num) ? arr << num : nil }
      arr
    else
      self.to_enum(:my_select)
    end
  end

  def my_all?
    if block_given?
      self.my_each { |i| yield(i) ? nil : (return false) } # had to use parentheses to make return false work!
      true
    else
      self.my_each { |i| i ? nil : (return false) }
    end
    true
  end

  def my_any?
    if block_given?
      self.my_each { |i| yield(i) ? (return true) : nil }
      false
    else
      self.my_each { |i| i ? (return true) : nil }  
    end
  end

  def my_none?
    if block_given?
      self.my_each { |i| yield(i) ? (return false) : nil }
      true
    else
      self.my_each { |i| i ? (return false) : nil }
      true
    end
  end

  def my_count(*param)
    if !param.empty?
      num = 0
      self.my_each { |i| i == param[0] ? num += 1 : nil }
      num
    elsif block_given?
      num = 0
      self.my_each { |i| yield(i) ? num += 1 : nil }
      num
    else
      self.length
    end
  end

  def my_map
    if block_given?
      arr = []
      self.my_each { |i| arr << yield(i) }
      arr
    else
      self.to_enum(:my_map)
    end
  end

  def my_inject(*init)
    self.class == Range ? self_arr = self.to_a : self_arr = self # convert range into array if needed
    init.empty? ? (acc = self_arr[0] and i = 1) : (acc = init[0] and i = 0)
    while i < self_arr.length
      acc = yield(acc, self_arr[i])
      i += 1
    end
    acc
  end
  
  # modified my_map method to take either a proc, a block, or both, but executing 
  # the block only if both are supplied

  def my_map_proc(proc = nil)
    if proc
      arr = []
      self.my_each { |i| arr << proc.call(i) }
      if block_given?
        self.my_each { |i| arr << yield(i) }
      end
      arr
    else
      return self
    end
  end


end

def multiply_els(arr)
  arr.my_inject { |acc, item| acc * item }
end
