=begin
 TODO Implement the ability to edit an employee in our employees program.
    -the edit actions should be e
    -editing a user is the same as adding, ask for their full name and id
    -print the current value for the full name and id before editing

TODO Implement the ability to sort either by first or last name to our employee program
    x-ask the user if they want to sort by first f or last l name
    x-print the sorted list depending on the user's action

TODO Implement the ability to insert programmers and office managers in our employee program.
    X-on the add action the user should be able to choose between adding a regular employee e, a programmer p or an office manager o.
    -on the view action next to programmers print the programming languages they know, next to office managers print their office.
    -assume that it's not possible to change an employee's role when editing
    -enable editing of programming language / office fields
=end
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

  def firstname
    @full_name.split(' ').first
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

  print 'Is this person an [e]mployee, [p]rogrammer or an [o]ffice manager?'
  position = get_action

  if position == 'e'
      employee = {
          full_name: full_name,
          id: id
      }
      employee = Employee.new(full_name, id)

  elsif position == 'p'
    puts 'Language: '
    language = gets.chomp
    employee = {
        full_name: full_name,
        id: id,
        language: language
    }
    employee = Programmer.new(full_name, id, language)

  elsif position == 'o'
    puts 'Office: '
    office = gets.chomp
    employee = {
        full_name: full_name,
        id: id,
        office: office
    }
    employee = OfficeManager.new(full_name, id, office)
  else
    puts 'Invalid position.'
  end

  employees << employee
end

def sort_employess(employees, argument)
  employees.sort_by do |employee|
    case argument
    when 'f' then employee.firstname
    when 'l' then employee.surname
    end
  end
end

def get_action
  return gets.downcase[0]
end

def view_employees(employees)
  puts 'Sort by [f]irst name or [l]ast name? '
  argument = gets.downcase[0]
  puts '[List of employees]'
  sort_employess(employees, argument).each do |employee|
    case argument
    when 'f' then puts "#{employee.firstname} #{employee.surname}, #{employee.id}"
    when 'l' then puts "#{employee.surname}, #{employee.firstname}, #{employee.id}"
    else
      puts 'Invalid argument input.'
      #FIXME make it go back to argument input
    end

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

