json.extract! webhook_action, :id, :title, :script_type, :script, :created_at, :updated_at
json.url webhook_action_url(webhook_action, format: :json)
