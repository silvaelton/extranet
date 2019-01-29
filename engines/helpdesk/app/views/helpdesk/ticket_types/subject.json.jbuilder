json.data @ticket_subjects.each do |row|
  json.id row.id
  json.name row.name
end