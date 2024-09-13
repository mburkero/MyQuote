json.extract! author, :id, :authFname, :authLname, :authByear, :authDyear, :biography, :user_id, :created_at, :updated_at
json.url author_url(author, format: :json)
