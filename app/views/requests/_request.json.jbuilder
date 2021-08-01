json.extract! request, :id, :name, :description, :created_at, :updated_at
json.url request_url(request, format: :json)
