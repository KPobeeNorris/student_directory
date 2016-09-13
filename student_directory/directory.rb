def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  while true
  # get the first name
  name = gets.chomp.capitalize
  if name.empty?
    break
  else
  puts "Add country of birth:"
  country = gets.chomp.capitalize
  puts "Which cohort are you joining?"
  cohort = gets.chomp.capitalize
  #add the student hash to the array
  students << {
    name: name,
    cohort: cohort,
    country: country
  }
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
   puts "The students of Villains Academy".center(100)
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
#nothing happens until we call the methods
students = input_students
print_header
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
