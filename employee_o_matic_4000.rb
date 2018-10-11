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

class Programmer < Employee
  attr_accessor :languages

  def initialize(full_name, id, langugages)
    super(full_name, id)
    @languages = languages
  end
end

class OfficeManager < Employee
  attr_accessor :office
  def initialize(full_name, id, office)
    super(full_name, id)
    @office = office
  end
end

def add_employee(employees)
  puts '[Add an employee]'
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp

  puts 'Is this person an [e]mployee, [p]rogrammer or an [o]ffice manager?'
  rank = get_action

  if rank == 'e'
      employee = {
          full_name: full_name,
          id: id
      }
      employee = Employee.new(full_name, id)

  elsif rank == 'p'
    puts 'Language: '
    language = gets.chomp
    employee = {
        full_name: full_name,
        id: id,
        language: language
    }
    employee = Programmer.new(full_name, id, language)

  elsif rank == 'o'
    puts 'Office: '
    office = gets.chomp
    employee = {
        full_name: full_name,
        id: id,
        office: office
    }
    employee = OfficeManager.new(full_name, id, office)
  else
    puts 'Invalid rank input.'
  end

  employees << employee
end

def sort_employess(employees)
  employees.sort_by do |employee|
    employee.surname
  end
end

def get_action
  return gets.downcase[0]
end

def view_employees(employees)
  puts '[List of employees]'
  sort_employess(employees).each do |employee|
    puts "#{employee.full_name}, #{employee.id}"
  end
end

def quit
  puts 'Goodbye!'
  exit
end

def print_help
  puts '[HELP]'
  puts 'Enter one of the following: '
  puts 'a - to add a new employee'
  puts 'e - to view existing employees'
  puts 'q - to quit the program'
end

puts "Employee-o-matic 4000"

employees = []

loop do
  print "What do you want to do? "
  action = get_action

  case action
  when 'a' then add_employee(employees)
  when 'e' then view_employees(employees)
  when 'q' then quit
  else
    print_help
  end
end

