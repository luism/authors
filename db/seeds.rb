# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
authors = [{name: 'Clark Kent', date_of_birth: '1958-06-18', email: 'ckent@gmail.com'},
           {name: 'Bruce Wayne', date_of_birth: '1939-02-18', email: 'bwayne@gmail.com'}]
Author.first_or_create(authors)
body1 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dignissim turpis. Aenean nec eros pulvinar, porta augue et, volutpat purus. Nullam dictum libero ut rutrum molestie. Aliquam erat volutpat. Maecenas suscipit rhoncus metus eget varius. Pellentesque in nisl maximus sapien laoreet convallis at sit amet sapien. Proin convallis tortor ut massa malesuada, ac pellentesque arcu tempor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer maximus felis et nisl laoreet porta. Curabitur condimentum orci at sem cursus faucibus. Vestibulum pretium congue dolor, sit amet tempor nunc finibus et. Quisque at nibh sagittis, fermentum massa eu, suscipit est. Nullam gravida lectus ac nulla rutrum, nec tincidunt sem sagittis. Phasellus placerat malesuada pretium. In libero neque, varius ut mauris ac, sagittis vulputate erat. Vestibulum ac est vel lacus ornare aliquet id et dolor.'
body2 = 'Nulla egestas orci id tempor rhoncus. Nam auctor lacus velit, nec lacinia ipsum rhoncus ut. Suspendisse sollicitudin turpis metus, ac pharetra eros dictum vel. Nam vitae nisi eu sapien facilisis facilisis. Nulla laoreet, nunc nec aliquet convallis, urna velit hendrerit tellus, eu accumsan est ante id diam. Mauris dignissim lacus interdum, commodo est et, rutrum ante. Phasellus sit amet pretium elit. Sed et arcu vel tellus viverra lacinia. Vivamus suscipit nulla libero, vitae mattis elit vehicula a. Praesent aliquam neque ac purus fermentum, pellentesque commodo nisl vestibulum. Maecenas vitae ligula metus. Pellentesque pulvinar pellentesque augue at gravida. Donec efficitur lacus sapien, eu vulputate libero tincidunt ac.'
Publication.first_or_create([{body: body1, title: 'Awesome title 1', publication_date: '2000/10/18', author: Author.first},
                             {body: body2, title: 'Awesome title 2', publication_date: '2001/09/21', author: Author.find_by_email(authors[1][:email])}])