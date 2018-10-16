class Employee
  attr_accessor :full_name
  attr_accessor :id

  def initialize(full_name, id)
    @full_name = full_name
    @id = id
  end

  def lastname
    @full_name.split(' ', 2).last       #split into 2 substrings, first and last name, take the latter
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

def add_employee(employees)               #      adds an employee to array
  puts '[Add an employee]'                #param +employees+ array of employees
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp

  position = nil
  loop do                                 #ask for input until correct format is entered
    print 'Is this person an [e]mployee, [p]rogrammer or an [o]ffice manager?'
    position = get_action
    case position
    when 'e' then break
    when 'p' then break
    when 'o' then break
    end
  end

  if position == 'e'
      employee = Employee.new(full_name, id)

  elsif position == 'p'
    print 'Languages: '
    languages = gets.chomp
    employee = Programmer.new(full_name, id, languages)

  elsif position == 'o'
    print 'Office: '
    office = gets.chomp
    employee = OfficeManager.new(full_name, id, office)
  end

  employees << employee
end

def edit_employee(employees)                #      edits employees
  puts 'Who do you want to edit?'           #param +employees+ array of existing employees
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp

  employee = employees.find{|employee| employee.full_name == full_name && employee.id == id}
  if employee != nil
      puts '[Selected employee]'
      puts "#{employee.full_name}, #{employee.id}"
      print 'New full name: '
      new_full_name = gets.chomp
      print 'New ID: '
      new_id = gets.chomp
      if employee.is_a?(OfficeManager)
        print 'New office: '
        new_office = gets.chomp
        if new_office.length > 0
          employee.office = new_office
        end
      elsif employee.is_a?(Programmer)
        print 'New languages: '
        new_languages = gets.chomp
        if new_languages.length > 0
          employee.languages = new_languages
        end
      end
      employee.full_name = new_full_name
      employee.id = new_id
      return                                #if an edit succeeded, exit method
  end
    puts 'No matching employee found.'
    edit_employee(employees)                #else, call method once again
     end                                    #it could be done using loop do...end through the whole method,
                                            #but it looks weird, I'm not aware if it could cause any problems

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
  when 'f' then print "#{employee.firstname} #{employee.lastname}, #{employee.id}"          #      prints an employee in "first/last name, last/first name, id" format
  when 'l' then print "#{employee.lastname}, #{employee.firstname}, #{employee.id}"         #param +employee+ employee with according hash you want printed
  end                                                                                           #param +argument+ if 'f' then first way of printing is used, if 'l' the other way is used

  case employee
  when OfficeManager then puts ", office: #{employee.office}"
  when Programmer then puts ", language: #{employee.languages}"
  when Employee then print "\n"
  end
end

def view_employees(employees)
  argument = nil
  loop do                                                             #ask for input until correct format is entered
    puts 'Sort by [f]irst name or [l]ast name? '
    argument = get_action
    break if argument == 'f' || argument == 'l'                       #      prints all employees
  end                                                                 #param +employees+ array of employees you want to print
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
