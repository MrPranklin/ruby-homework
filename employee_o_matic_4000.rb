=begin
 TODO Implement the ability to edit an employee in our employees program.
    x-the edit actions should be e;
    editing a user is the same as adding, ask for their full name and id
    x-print the current value for the full name and id before editing

TODO Implement the ability to sort either by first or last name to our employee program
    x-ask the user if they want to sort by first f or last l name
    x-print the sorted list depending on the user's action

TODO Implement the ability to insert programmers and office managers in our employee program.
    X-on the add action the user should be able to choose between adding a regular employee e, a programmer p or an office manager o.
    x-on the view action next to programmers print the programming languages they know, next to office managers print their office.
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

  def lastname
    @full_name.split(' ', 2).last   #split into 2 substrings, first and last name, take the latter
  end

  def firstname
    @full_name.split(' ').first
  end
end

class Programmer < Employee
  attr_accessor :languages

  def initialize(full_name, id, languages)
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

  employee = {
      full_name: full_name,
      id: id,
  }
  position = nil
  loop do              #ask for input until correct format is entered
    print 'Is this person an [e]mployee, [p]rogrammer or an [o]ffice manager?'
    position = get_action
    break if position == 'e' || position == 'p' || position == 'o'
  end

  if position == 'e'
      employee = Employee.new(full_name, id)

  elsif position == 'p'
    print 'Languages: '
    languages = gets.chomp
    employee={
        languages: languages
    }
    employee = Programmer.new(full_name, id, languages)

  elsif position == 'o'
    print 'Office: '
    office = gets.chomp
    employee = {
        office: office
    }
    employee = OfficeManager.new(full_name, id, office)
  end

  employees << employee
end

def edit_employee(employees)
  puts 'Who do you want to edit?'
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp

  employees.each do |employee|
    if employee.full_name == full_name && employee.id == id
      puts '[Selected employee]'
      puts "#{employee.full_name}, #{employee.id}"
      print 'New full name: '
      new_full_name = gets.chomp
      print 'New ID: '
      new_id = gets.chomp
      if employee.is_a?(Programmer)
        print 'Change languages? [y/n] '
        edit = get_action
        if edit == 'y'
          print 'New languages: '
          employee.languages = gets.chomp
          end
      elsif employee.is_a?(OfficeManager)
        print'Change office? [y/n]'
        edit = get_action
        if edit == 'y'                       #FIXME class speciality edit not working
          print 'New office: '
          employee.office = gets.chomp
        end
      end
      employee.full_name = new_full_name
      employee.id = new_id
      return                                #if an edit succeeded, exit method
    end
    puts 'No matching employee found.'
    edit_employee(employees)                #else, call method once again
  end                                       #could be done using loop do...end through the whole method,
end                                         #but it looks weird, I'm not aware if it could cause any problems

def sort_employees(employees, argument)
  employees.sort_by do |employee|
    case argument
    when 'f' then employee.firstname
    when 'l' then employee.lastname
    end
  end
end

def get_action
  return gets.downcase[0]
end

def print_employee(employee, argument)
  case argument
  when 'f' then print "#{employee.firstname} #{employee.lastname}, #{employee.id}"
  when 'l' then print "#{employee.lastname}, #{employee.firstname}, #{employee.id}"
  end

  case employee
  when OfficeManager then puts ", #{employee.office}"
  when Programmer then puts ", #{employee.languages}"
  when Employee then print "\n"
  end
end

def view_employees(employees)
  argument = nil
  loop do         #ask for input until correct format is entered
    puts 'Sort by [f]irst name or [l]ast name? '
    argument = get_action
    break if argument == 'f' || argument == 'l'
  end

  puts '[List of employees]'
  sort_employees(employees, argument).each do |employee|
    print_employee(employee, argument)
  end
end

def quit
  puts 'Goodbye!'
  exit
end

def print_action_help
  puts '[HELP]'
  puts 'Enter one of the following: '
  puts 'a - to add a new employee'
  puts 'e - to edit existing employees'
  puts 'v - to view existing employees'
  puts 'q - to quit the program'
end

puts "Employee-o-matic 4000"

employees = []

loop do
  print 'What do you want to do? '
  action = get_action

  case action
  when 'a' then add_employee(employees)
  when 'e' then edit_employee(employees)
  when 'v' then view_employees(employees)
  when 'q' then quit
  else
    print_action_help
  end
end
