class Employee
  attr_accessor :full_name
  attr_accessor :id

  def initialize(full_name, id)
    @full_name = full_name
    @id = id
  end

  def surname
    @full_name.split(' ', 2).last
  end
end

employee = Employee.new('Filip Đontra Pranklin', 0036506134)
puts employee.full_name
puts employee.id
puts employee.surname