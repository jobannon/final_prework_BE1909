class Employee
  attr_reader :name, :age, :salary
  def initialize(emp_data)
    @name = emp_data[:name]
    @age = emp_data[:age].to_i
    @salary = emp_data[:salary].to_i
  end
end
