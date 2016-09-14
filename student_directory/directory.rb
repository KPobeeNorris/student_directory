@students = []

def input_students
  puts "Please enter the name(s) of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  while true
  # get the first name
  name = STDIN.gets[0...-1].capitalize
  if name.empty?
    break
  else
  puts "Add country of birth:"
  country = STDIN.gets.chomp.capitalize
  if country == ''
    country = 'TBC'
  end
  puts "Which cohort are you joining?"
  cohort = STDIN.gets.chomp.capitalize
  if cohort == ''
    cohort = 'TBC'
  end
  #add the student hash to the array
  puts "You've entered the following: Name - #{name}, Country -#{country} and Cohort - #{cohort}." +
   " Is this data correct? (Y/N)?"
  answer = gets.chomp.upcase
  if answer == 'N'
    break
  else
  @students << {
    name: name.to_sym,
    cohort: cohort.to_sym,
    country: country.to_sym
  }
end
  end
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  elsif @students.count > 1
    puts "Now we have #{@students.count} students"
  end
end

  # return the array of students
#  students - BLANKED OUT!
end

 def print_header
   puts "The Students of Villains Academy".center(100)
   puts " -------------".center(100)
 end

 def print_students_list
   @students.each do |student|
     puts "#{student[:name]} (#{student[:cohort]} cohort): Country of birth: #{student[:country]}".center(100)
   end
 end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(100)
  elsif @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(100)
  end
end

def interactive_menu
  load_students
  puts "Loaded #{@students.count} students from previous sesssion."
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will terminate the program
    else "I don't know what you meant, try again"
    end
  end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # we'll be adding more later
end

def show_students
  #if !students.empty?
  print_header
  print_students_list
  print_footer
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "File successfully saved"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, country = line.chomp.split(',')
    @students << {name: name, cohort: cohort, country: country}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


#nothing happens until we call the methods
try_load_students
interactive_menu
# students = input_students
# if !students.empty?
#   print_header
# end
# print(students)
# #cosort(students)
# print_footer(students)





# Exercise 8 - No 8:
#  def cosort(students)
#    puts students.group_by {|a| a[:cohort]}.sort
#  end

 # Exercies 8 - No 4:
 # Description: alternative way of printing our all students
 # def print(students)
 #   count = 0
 #   until count == students.length
 #   students.each do |student|
 #       puts "#{student[:name]} (#{student[:cohort]} cohort)"
 #       count += 1
 #     end
 #   end
 # end

# Exercise 8 - No 3:
# Description: Print if name is less than 12 characters long
# def print(students)
#   students.each do |student|
#     if student[:name].length < 12
#       puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
#     end
#   end
# end


# Exercise 8 - No 2:
# Description: print if name begins with specific letter
# def print(students)
#   students.each do |student|
#     if student[:name].start_with? "D"
#       puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
#     end
#   end
# end

# Exercise 8 - No 1:
# def print(students)
#    students.each_with_index do |student, index|
#      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
#    end
# end
