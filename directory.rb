#first we put all the students into an array
def input_students
  puts "Please enter the name and cohort of the student as 'name, cohort'"
  puts "To finish, just hit return three times"
  # create an empty array
  students = []
  # get the first name
  name_cohort = gets.chomp
  name = name_cohort.split(",")[0]
  cohort = name_cohort.split(",")[1]
  # while the name is not empty, repeat this code
  puts "Please enter a hobby"
  hobby = gets.chomp
  while !name_cohort.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name_cohort = gets.chomp
    name = name_cohort.split(",")[0]
    cohort = name_cohort.split(",")[1]
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
        puts "#{students[i][:name]} (#{students[i][:cohort]} cohort) Hobby: #{students[i][:hobby]}".center(150)
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
