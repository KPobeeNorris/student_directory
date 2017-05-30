Code not being used in the directory program:


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

try_load_students

Exercise 8 - No 8:
 def cosort(students)
   puts students.group_by {|a| a[:cohort]}.sort
 end

 Exercies 8 - No 4:
 Description: alternative way of printing our all students
 def print(students)
   count = 0
   until count == students.length
   students.each do |student|
       puts "#{student[:name]} (#{student[:cohort]} cohort)"
       count += 1
     end
   end
 end

Exercise 8 - No 3:
Description: Print if name is less than 12 characters long
def print(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
  end
end


Exercise 8 - No 2:
Description: print if name begins with specific letter
def print(students)
  students.each do |student|
    if student[:name].start_with? "D"
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
  end
end

Exercise 8 - No 1:
def print(students)
   students.each_with_index do |student, index|
     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
   end
end
