@students = []

def input_students
  puts "Please enter the name(s) of the students"
  puts "To finish, just hit return twice"
  while true
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
  puts "You've entered the following: Name - #{name}, Country -#{country} and Cohort - #{cohort}." +
   " Is this data correct? (Y/N)?"
  answer = gets.chomp.upcase
  if answer == 'N'
    break
  else
    add_students(name: name, cohort: cohort, country: country)
  end
  end
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  elsif @students.count > 1
    puts "Now we have #{@students.count} students"
  end
end
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
  load_file
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
      print_students
    when "3"
      save_file
    when "4"
      load_file
    when "9"
      puts "Thank you, come again!"
      exit # this will terminate the program
    else "Does not compute...try again."
    end
  end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end


def print_students
  #if !students.empty?
  print_header
  print_students_list
  print_footer
end


def save_file

  puts "Please enter name of file you wish to save to: "
  save_file = STDIN.gets.chomp
  if File.exists?(save_file)
    file = File.open(save_file, "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:country]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    puts "You've saved the students!"
    #file.close
    else
      file = File.new(save_file, "w")
      @students.each do |student|
        student_data = [student[:name], student[:cohort], student[:country]]
        csv_line = student_data.join(",")
        file.puts csv_line
      end
    end
end


def load_file
  puts "Please enter name of file you wish to load:"
  load_file = STDIN.gets.chomp
  if File.exists?(load_file)
    file = File.open(load_file, "r")
    file.readlines.each do |line|
      name, cohort, country = line.chomp.split(',')
      add_students(name: name, cohort: cohort, country: country)
    end
    #file.close
  else
    file = File.new(load_file, "w")
    file.close
    end
  end
#end

def add_students(info)
  @students << info
end

interactive_menu

# def try_load_students
#   filename = ARGV.first # first argument from the command line
#   return if filename.nil? # get out of the method if it isn't given
#   if File.exists?(filename) # if it exists
#     load_students(filename)
#     puts "Loaded #{@students.count} from #{filename}"
#   else # if it doesn't exists
#     puts "Sorry, #{filename} doesn't exist."
#     exit # quit the program
#   end
# end
#
# try_load_students

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
