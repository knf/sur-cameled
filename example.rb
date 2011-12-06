Employee.all.each do |employee|
  surname = SurCameled::Surname.parse(employee.last_name)
  if surname
    puts "UPDATING: #{employee.full_name} with #{surname}"
    employee.update_attributes(:last_name => surname)
  end
end