#!/usr/bin/env ruby

require 'csv'

old_table = CSV.read('./src/diabetes.csv', :headers => true, converters: :numeric)
old_table.delete("Triceps skin fold thickness (mm)")

new_header_array = ["transaction_id", "Number of times pregnant", "Plasma glucose concentration", "Diastolic blood pressure (mm Hg)", "2-Hour serum insulin (mu U/ml)", "Body mass index (weight in kg/(height in m)^2)", "Diabetes pedigree function", "Age (years)", "Class", "Age (days)"]
age_in_years = old_table["Age (years)"]
age_in_days = Array.new 

old_table.select do |row|
  age_in_days << (row["Age (years)"].to_i * 365).to_s
end 

CSV.open('./output.csv', 'w') do |new_table|
  new_table << new_header_array
  old_table.each do |old_row|
    new_table.puts old_row
    # new_table[-1].puts age_in_days
  end 
end 

print "New output file created.\n"