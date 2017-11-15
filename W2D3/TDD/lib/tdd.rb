

class Array
  def my_uniq
    new_array = []
    self.each { |el| new_array << el unless new_array.include?(el) }
    new_array
  end
  
  def two_sum
    indices = []
    self.each_with_index do |el, i|
      (i + 1).upto(self.size - 1) do |j|
        if (el + self[j]).zero?
          indices << [i, j]
        end
      end
    end
  indices
  end 
  
  def my_transpose 
    transposed = []
    self.each_with_index do |row,i| 
      transposed << self.map {|row| row[i]}
    end 
    transposed
  end
  
  def stock_picker
    best_days = {}
    
    0.upto(self.size - 2) do |i|
      1.upto(self.size - 1) do |j|
        if i < j
          days = [i, j]
          best_days[days] = self[j] - self[i] if (self[j] - self[i]) > 0 
        end
      end
    end
    best_days.empty? ? 0 : best_days.sort_by { |k, v| v }.last.first
  end 
end