@students = []

# displays the interactive menu
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

#first we put all the students into an array
def input_students
  puts "Please enter the name and cohort of the student as 'name, cohort'"
  puts "To finish, just hit return three times"
  # create an empty array
  @students = []
  # get the first name
  name_cohort = gets.strip
  name = name_cohort.split(", ")[0]
  cohort = name_cohort.split(", ")[1]
  # while the name is not empty, repeat this code
  puts "Please enter a hobby"
  hobby = gets.chomp
  while !name_cohort.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else 
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name_cohort = gets.chomp
    name = name_cohort.split(",")[0]
    cohort = name_cohort.split(",")[1]
    hobby = gets.chomp
  end
end

def process(selection)
  case selection
  when "1"
    # input the students
    students = input_students
  when "2"
    # show the students
    show_students
  when "3"
    # save the list to a file
    save_students
  when "4"
    # load the list from students.csv
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again" 
  end
end

def print_header
    puts "The Students of Villains Academy"
    puts "-------------"
end

def print_students_list
    all_cohorts = @students.map do |student|
        student[:cohort]
    end
    cohort_groups = all_cohorts.sort.uniq
    j = 0
    while j < cohort_groups.length do
        @students.each do |student| 
            if student[:cohort] == cohort_groups[j]
                puts "#{student[:name]} (#{student[:cohort]} cohort) Hobby: #{student[:hobby]}".center(100)
            end
        end
        j = j+1
    end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_footer
    if @students.count == 1
      puts "Overall, we have #{@students.count} great student"
    else
      puts "Overall, we have #{@students.count} great students"
    end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

#then we call the methods
interactive_menu
