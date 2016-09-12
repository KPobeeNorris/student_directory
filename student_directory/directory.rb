def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

 def print_header
   puts "The students of Villans Academy"
   puts " -------------"
 end

 # def print(students)
 #   students.each do |student|
 #     if student ==
 #     puts "#{student[:name]} (#{student[:cohort]} cohort)"
 #   end
 # end

# Exercise 8 - No 3:
# def print(students)
#   students.each do |student|
#     if student[:name].length < 12
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

def print(students)
  students.each do |student|
    if student[:name[0]] == "D"
      puts "#{student[:name]}"
    end
  end
end

# Exercise 8 - No 1:
# def print(students)
#    students.each_with_index do |student, index|
#      puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
#    end
# end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
