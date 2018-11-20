json.extract! gig, :id, :name, :description, :timeline, :project_id, :created_at, :updated_at
json.url gig_url(gig, format: :json)
