def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  puts "Add country of birth:"
  country = gets.chomp.capitalize
  puts "Which cohort are you joining?"
  cohort = gets.chomp.capitalize
  puts "Add gender:"
  gender = gets.chomp
  puts "Hobbies - seperate with a comma:"
  hobbies = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort, country: country, gender: gender, hobbies: hobbies}
    if students.count == 1
      puts "Now we have #{students.count} student"
    elsif students.count > 1
      puts "Now we have #{students.count} students"
    end
    # gets another name from the user
    name = gets.chomp.capitalize
      if name != ''
        puts "Country of birth:"
        country = gets.chomp.capitalize
        puts "Cohort:"
        cohort = gets.chomp
        puts "Gender:"
        gender = gets.chomp
        puts "Hobbies:"
        hobbies = gets.chomp
      end


  end
  # return the array of students
  students
end

 def print_header
   puts "The students of Villans Academy".center(100)
   puts " -------------".center(100)
 end

 def print(students)
   students.each do |student|
     puts "#{student[:name]} (#{student[:cohort]} cohort): Country of birth: #{student[:country]}. Gender: #{student[:gender]}. Hobbies: #{student[:hobbies]}".center(100)
   end
 end

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
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end


# Exercise 8 - No 2:
# Description: print if name begins with specific letter
# def print(students)
#   students.each do |student|
#     if student[:name].start_with? "D"
#       puts "#{student[:name]}"
#     end
#   end
# end

# Exercise 8 - No 1:
# def print(students)
#    students.each_with_index do |student, index|
#      puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
#    end
# end


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
print_footer(students)
