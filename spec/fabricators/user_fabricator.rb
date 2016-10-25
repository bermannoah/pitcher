Fabricator(:user) do
  name            { Faker::Name.name }
  email           { |attrs| "#{attrs[:name].parameterize}@example.com"}
  password_digest { sequence(:password, 11111111111111) }
end
