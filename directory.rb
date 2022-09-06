
@students []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :cohort}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end 


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list students.cvs"
    puts "9. Exit"

    selection = gets.chomp

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def save(students)
  file = File.open("students.cvs", "W")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    cvs_line = student_data.join(",")
    file.puts cvs_line
  end
  file.close
end

def print_footer(students)
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu 