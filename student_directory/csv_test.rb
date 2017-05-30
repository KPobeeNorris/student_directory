require 'csv'

# CSV.foreach('customer.csv') do |row|
#   puts row.inspect
# end

# a_string = "Dan,34\nMaria,55"
# CSV.parse(a_string) {|row| puts row.inspect}

new_customers = CSV.read('new_customers.csv', {:col_sep => ';'})
CSV.foreach('new_customers.csv', {:col_sep => ';'}) {|row| p row}
