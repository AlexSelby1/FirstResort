json.extract! job, :id, :title, :country, :category, :description, :user_id, :created_at, :updated_at
json.url job(job, format: :json)
