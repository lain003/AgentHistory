json.array!(@capture_histories) do |capture_history|
  json.extract! capture_history, :id, :ident_code, :action_time, :agent_id, :portal_id
  json.url capture_history_url(capture_history, format: :json)
end
