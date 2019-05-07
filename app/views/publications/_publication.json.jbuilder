json.extract! publication, :id, :body, :title, :publication_date, :author_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
