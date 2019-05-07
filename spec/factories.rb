FactoryBot.define do
  
  factory :author do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday(40, 80) }

    # user_with_posts will create post data after the user has been created
    factory :author_with_publications do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        publications_count { 5 }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |author, evaluator|
        create_list(:publication, evaluator.publications_count, author: author)
      end
    end
  end

  factory :publication do
    author

    body { Faker::Lorem.paragraphs(5)}
    title { Faker::Lorem.sentence }
    publication_date { Faker::Date.between(100.days.ago, Date.today) }
  end
end