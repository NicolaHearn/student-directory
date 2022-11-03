def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      # input the students
      students = input_students
    when "2"
      # show the students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again" 
    end
  end
end

#first we put all the students into an array
def input_students
  puts "Please enter the name and cohort of the student as 'name, cohort'"
  puts "To finish, just hit return three times"
  # create an empty array
  students = []
  # get the first name
  name_cohort = gets.strip
  name = name_cohort.split(", ")[0]
  cohort = name_cohort.split(", ")[1]
  # while the name is not empty, repeat this code
  puts "Please enter a hobby"
  hobby = gets.chomp
  while !name_cohort.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else 
      puts "Now we have #{students.count} students"
    end
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
    all_cohorts = students.map do |student|
        student[:cohort]
    end
    cohort_groups = all_cohorts.sort.uniq
    j = 0
    while j < cohort_groups.length do
        students.each do |student| 
            if student[:cohort] == cohort_groups[j]
                puts "#{student[:name]} (#{student[:cohort]} cohort) Hobby: #{student[:hobby]}".center(100)
            end
        end
        j = j+1
    end
end

def print_footer(names)
    if names.count == 1
      puts "Overall, we have #{names.count} great student"
    else
      puts "Overall, we have #{names.count} great students"
    end
end

#then we call the methods
interactive_menu
students = input_students
print_header
print(students)
print_footer(students)
