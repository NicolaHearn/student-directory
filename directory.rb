#first we put all the students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  puts "Please enter a hobby"
  hobby = gets.chomp
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    hobby = gets.chomp
  end
  # return the array of students
  return students
end

def print_header
    puts "The Students of Villains Academy"
    puts "-------------"
end

def print(students)
    i = 0
    while i < students.length do 
        puts "#{students[i][:name]} (#{students[i][:cohort]} cohort. Hobby: #{students[i][:hobby]})"
        i = i + 1
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

#then we call the methods
students = input_students
print_header
print(students)
print_footer(students)
