json.array!(@agents) do |agent|
  json.extract! agent, :id, :name, :team_id
  json.url agent_url(agent, format: :json)
end
