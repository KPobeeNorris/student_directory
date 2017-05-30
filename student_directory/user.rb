def input_students
  puts "Please enter the name(s) of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  while true
  # get the first name
  name = gets[0...-1].capitalize
  if name.empty?
    break
  else
  puts "Add country of birth:"
  country = gets.chomp.capitalize
  if country == ''
    country = 'TBC'
  end
  puts "Which cohort are you joining?"
  cohort = gets.chomp.capitalize
  if cohort == ''
    cohort = 'TBC'
  end
  #add the student hash to the array
  puts "You've entered the following: Name - #{name}, Country -#{country} and Cohort - #{cohort}." +
  puts "  Is this data correct? (Y/N)?"
  answer = gets.chomp.upcase
  if answer == 'N'
    break
  else
  students << {
    name: name.to_sym,
    cohort: cohort.to_sym,
    country: country.to_sym
  }
end
  end
  if students.count == 1
    puts "Now we have #{students.count} student"
  elsif students.count > 1
    puts "Now we have #{students.count} students"
  end
end

  # return the array of students
  students
end

 def print_header
   puts "The Students of Villains Academy".center(100)
   puts " -------------".center(100)
 end

 def print(students)
   students.each do |student|
     puts "#{student[:name]} (#{student[:cohort]} cohort): Country of birth: #{student[:country]}".center(100)
   end
 end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(100)
  elsif names.count > 1
    puts "Overall, we have #{names.count} great students".center(100)
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it to a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else "I don't know what you meant, try again"
    end
  end
end

#nothing happens until we call the methods
interactive_menu
students = input_students
if !students.empty?
  print_header
end
print(students)
#cosort(students)
print_footer(students)





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
