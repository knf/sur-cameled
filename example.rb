%w(O'brian Maclaren Maclaughlin Maclea Maclean Mcgovern).each do |name|
  surname = SurCameled::Surname.parse(name)
  if surname
    puts surname
  end
end

# O'Brian
# MacLaren
# MacLaughlin
# MacLea
# MacLean
# McGovern
