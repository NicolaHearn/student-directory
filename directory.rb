@students = []

# displays the interactive menu
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
  name_cohort = STDIN.gets.strip
  name = name_cohort.split(", ")[0]
  cohort = name_cohort.split(", ")[1]
  # while the name is not empty, repeat this code
  puts "Please enter a hobby"
  hobby = gets.chomp
  while !name_cohort.empty? do
    # add the student hash to the array
    add_students_to_hash(name, cohort)
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else 
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name_cohort = STDIN.gets.chomp
    name = name_cohort.split(",")[0]
    cohort = name_cohort.split(",")[1]
    hobby = STDIN.gets.chomp
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
    puts "Which file would you like to save to?"
    save_file_name = STDIN.gets.chomp
    save_students(save_file_name)
    puts "students saved to students.csv"
  when "4"
    # load the list from students.csv
    puts "Which file would you like to load from?"
    load_file_name = STDIN.gets.chomp
    load_students(load_file_name)
    puts "students loaded from students.csv"
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

def add_students_to_hash(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
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

def save_students(filename)
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students_to_hash(name, cohort)
  end
  file.close
end

def try_load_students(filename = "students.csv")
  if File.exists?(ARGV.first.to_s)
    filename = ARGV.first
    puts "Loaded #{@students.count} from #{filename}"
  elsif !ARGV.first
    puts "Loading default file 'students.csv'"
    filename = filename
  else 
    puts "Sorry, the file you requested doesn't exist, loading 'students.csv' instead."
    filename = filename
  end
end

#then we call the methods
try_load_students
interactive_menu
