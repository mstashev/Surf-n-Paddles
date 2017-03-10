# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# seed your database with 15 posts by five users


def rand_time(from, to=Time.now)
  Time.at(rand(from.to_f..to.to_f))
end

5.times do
  user = User.create!(
          name:     Faker::Name.unique.name,
          username: Faker::Internet.unique.user_name,
          email:    Faker::Internet.unique.email,
          password: "password",
          avatar_url: "http://fillmurray.com/g/300/300"
        )
  15.times do
    user.posts.create!(
      title:  Faker::Book.unique.title,
      body:   Faker::Lorem.paragraphs(4, true).join("\n\n"),
      created_at: rand_time(2.years.ago)
    )
  end

end

puts "Seeds complete."
