require 'byebug'

class Employee
  
  attr_accessor :salary, :title
  attr_reader :name, :boss

  def initialize(name, title, salary = 0, manager = nil)
    @name = name
    @title = title
    @salary = salary
    
    @boss = manager

    @boss.add_underling(self) if @boss
  end
  
  def bonus(multiplier = 1)
    bonus = self.salary * multiplier
  end
end

class Manager < Employee
  
  attr_accessor :underlings, :under_bonus
  
  def initialize(name, title, salary = 0, manager = nil)
    super
    @underlings = []
  end
  
  
  def bonus(multiplier = 1)
    base = @underlings.map { |ling| ling.bonus(1) }.reduce(:+)
    bonus_base = (base) 
    bonus_base += salary if @boss
    bonus_base * multiplier
  end
  
  
  def add_underling(underling)
    @underlings << underling
  end
end
# 
# # if __FILE__ == $PROGRAM_NAME
#   ned = Manager.new("Ned", "Founder", 1_000_000, nil)
#   darren = Manager.new("Darren", "TA Manager", 78_000, ned)
#   shawna = Employee.new("Shawna", "TA", 12_000, darren)
#   david = Employee.new("David", "TA", 10_000, darren)
# 
# 




