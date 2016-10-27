Fabricator(:pitch) do
  title   { Faker::Book.title }
  content { Faker::Lorem.paragraph }
end
