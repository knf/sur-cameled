Employee.all.each do |employee|
  surname = SurCameled::Surname.parse(employee.last_name)
  if surname
    employee.update_attributes(:last_name => surname)
  end
end