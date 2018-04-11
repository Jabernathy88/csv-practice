require 'CSV'

csv_table = CSV.read("diabetes.csv", :headers => true)
csv_table.delete("Triceps skin fold thickness (mm)")
csv_table.to_csv