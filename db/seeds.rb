# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
20.times do
  User.create!({first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: Faker::Internet.password(8) })
end

User.create!({first_name: "Johnny",
             last_name: "Admin",
             username: "i_am_admin",
             email: "admin@admin.com",
             password: "password",
             confirmed_at: Time.now,
             is_admin: true })

User.create!({first_name: "Timmy",
             last_name: "User",
             username: "normal_user",
             email: "user@user.com",
             password: "password",
             confirmed_at: Time.now
              })


base_points = 10

User.all.each do |user|
  user.points = base_points * rand(1..1000)
  user.save!
end


categories = ["Ruby", "JavaScript"]
categories.each do |category|
  Category.create!(name: category)
end



drill_groups_ruby = [{name: "Operators", category: Category.all[0]}, {name: "Flow Control", category: Category.all[0]}, {name: "Loops", category: Category.all[0]}, {name: "Arrays", category: Category.all[0]}, {name: "Hashes", category: Category.all[0]}]
drill_groups_ruby.each do |group|
  DrillGroup.create!(name: group[:name], category: group[:category])
end



operators    = [ {skill_level: 1, drill_group: DrillGroup.find_by_name("Operators"), title: "Or Statement", description: "!(10 == 1 || 1000 == 1000)", hint: "hint goes here" },
                 {skill_level: 2, drill_group: DrillGroup.find_by_name("Operators"), title: "And Statement", description: "1 == 1 && 2 == 1", hint: "hint goes here" } ]
operators.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end



flow_control = [ {skill_level: 1, drill_group: DrillGroup.find_by_name("Flow Control"), title: "If Statement IV", description: "Write a code that will check if a given variables a is greater than 10 then it will print 'Hello World'. If it's greater than 100 it will print 'Hello Universe'. Otherwise it will do nothing.", hint: "hint goes here" },
                 {skill_level: 3, drill_group: DrillGroup.find_by_name("Flow Control"), title: "If Statement II", description: "Write code that takes a number and then prints the power of three of that number if it's divisible by three and it prints the power of two if it's divisible by 2 and prints the number itself otherwise.", hint: "hint goes here" } ]
flow_control.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end


loops        = [ {skill_level: 2, drill_group: DrillGroup.find_by_name("Loops"), title: "While Loop VI", description: "Use while loop to print 1 to 15 (both numbers included)", hint: "hint goes here" },
                 {skill_level: 1, drill_group: DrillGroup.find_by_name("Loops"), title: "While Loop III", description: "Print 10 to 20 using for loop in two ways: 1- using range with three dots 2- using range with two dots", hint: "hint goes here" } ]
loops.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end


arrays       = [ {skill_level: 3, drill_group: DrillGroup.find_by_name("Arrays"), title: "Unitl you type 'exit'", description: "Keep asking user for input and add their input to an array until they type 'exit'. After that print out the number of input they've entered. For example print: You've entered 10 inputs", hint: "hint goes here" },
                 {skill_level: 2, drill_group: DrillGroup.find_by_name("Arrays"), title: "Array Length", description: "Given an array of words. Return back an array of numbers that contains the length of each word in the first array in the same order.", hint: "hint goes here" } ]
arrays.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end


hashes       = [ {skill_level: 1, drill_group: DrillGroup.find_by_name("Hashes"), title: "Large City?", description: "Write a method that takes the hash and prints if city is large (more than 100,000) or small (otherwise). Printing something like: Vancouver is a large city", hint: "hint goes here" },
                 {skill_level: 3, drill_group: DrillGroup.find_by_name("Hashes"), title: "User information", description: "Ask the user for the following information: first name, last name and age. Store all the entered data in a hash and then loop through the hash and display results.", hint: "hint goes here" } ]
hashes.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end


drill_groups_javascript = [{name: "Recursion", category: Category.all[1]}, {name: "Conditional Statements", category: Category.all[1]}, {name: "Arrays", category: Category.all[1]}, {name: "Math", category: Category.all[1]}, {name: "Validation", category: Category.all[1]}]
drill_groups_javascript.each do |group|
  DrillGroup.create!(name: group[:name], category: group[:category])
end



recursion                 = [ {skill_level: 2, drill_group: DrillGroup.find_by_name("Recursion"), title: "Integer Range", description: "Write a JavaScript program to get the integers in range (x, y).", hint: "hint goes here" },
                              {skill_level: 3, drill_group: DrillGroup.find_by_name("Recursion"), title: "Fibonacci Time", description: "Write a JavaScript program to get the first n Fibonacci numbers.", hint: "hint goes here" } ]
recursion.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end



conditional_statements    = [ {skill_level: 1, drill_group: DrillGroup.find_by_name("Conditional Statements"), title: "Iterate form 0 to 15",  description: "Write a JavaScript for loop that will iterate from 0 to 15. For each iteration, it will check if the current number is odd or even, and display a message to the screen.", hint: "hint goes here" },
                              {skill_level: 2, drill_group: DrillGroup.find_by_name("Conditional Statements"), title: "FizzBuzzzz", description: "Write a JavaScript program which iterates the integers from 1 to 100. But for multiples of three print 'Fizz' instead of the number and for the multiples of five print 'Buzz'. For numbers which are multiples of both three and five print 'FizzBuzz'.", hint: "hint goes here" } ]
conditional_statements.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end



arrays                    = [ {skill_level: 1, drill_group: DrillGroup.find_by_name("Arrays"), title: "Most Frequent Item", description: "Write a JavaScript program to find the most frequent item of an array.", hint: "hint goes here" },
                              {skill_level: 2, drill_group: DrillGroup.find_by_name("Arrays"), title: "Remove Duplication", description: "Write a JavaScript program to remove duplicate items from an array (ignore case sensitivity).", hint: "hint goes here" } ]
arrays.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end



math                      = [ {skill_level: 3, drill_group: DrillGroup.find_by_name("Math"), title: "Random Integer", description: "Write a JavaScript function to generate a random integer.", hint: "hint goes here" },
                              {skill_level: 1, drill_group: DrillGroup.find_by_name("Math"), title: "Highest Value", description: "Write a JavaScript function to find the highest value in an array.", hint: "hint goes here" } ]
math.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end


validation                = [ {skill_level: 2, drill_group: DrillGroup.find_by_name("Validation"), title: "Uppercase?", description: "Write a JavaScript program to test the first character of a string is uppercase or not.", hint: "hint goes here" },
                              {skill_level: 3, drill_group: DrillGroup.find_by_name("Validation"), title: "Valid URL?", description: "Write a JavaScript function to check whether a given value is an valid url or not.", hint: "hint goes here" } ]
validation.each do |drill|
  Drill.create!(title: drill[:title], base_points: 100, skill_level: drill[:skill_level], drill_group: drill[:drill_group], description: drill[:description], hint: drill[:hint])
end


Drill.all.each do |drill|
  Solution.create!(drill: drill, body: "answer")
end
