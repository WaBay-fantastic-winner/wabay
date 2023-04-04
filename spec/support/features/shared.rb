def fill_shared_fields
  fill_in 'project_organizer', with: Faker::Name.name
  fill_in 'project_amount_target', with: Faker::Number.number(digits: 4)
  attach_file('project_avatar', File.absolute_path('app/assets/images/wubay.png'))
  find("input#project_end_time").set("#{Date.new.end_of_year + 1}")
  find("trix-editor").set(Faker::Food.description)
end