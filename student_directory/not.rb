require 'csv'

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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
      puts "Thank you, hurry back!"
      exit # this will terminate the program
    else "Does not compute...try again."
    end
  end


def input_students
  puts "Please enter the name(s) of the students; to finish just hit return twice"
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
  puts "You've entered the following: Name - #{name}, Country - #{country} and Cohort - #{cohort}." +
   " Is this data correct? (Y/N)?"
  answer = gets.chomp.upcase
  answer == 'N' ? break : add_students(name: name, cohort: cohort, country: country)
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

 def print_students
   print_header
   print_students_list
   print_footer
 end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(100)
  elsif @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(100)
  end
end


def save_file
  puts "Please enter name of file you wish to save to: "
  save_file = STDIN.gets.chomp
  CSV.open(save_file, 'w') do |obj|
      @students.each do |student|
        student = [student[:name], student[:cohort], student[:country]]
      obj << student
    end
  end
  puts "You've saved the students!"
end




def load_file
  puts "Please enter name of file you wish to load:"
  load_file = STDIN.gets.chomp
    CSV.foreach(load_file) do |row|
      name, cohort, country = row[0], row[1], row[2]
      add_students(name: name, cohort: cohort, country: country)
    end
  end



def add_students(info)
  @students << info
end

interactive_menu
