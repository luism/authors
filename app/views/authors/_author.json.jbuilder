json.extract! author, :id, :name, :email, :date_of_birth, :created_at, :updated_at
json.url author_url(author, format: :json)
