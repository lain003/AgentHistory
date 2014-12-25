json.array!(@link_histories) do |link_history|
  json.extract! link_history, :id, :ident_code, :action_time, :agent_id, :to_portal_id, :from_portal_id
  json.url link_history_url(link_history, format: :json)
end
