json.array!(@destroye_histories) do |destroye_history|
  json.extract! destroye_history, :id, :ident_code, :action_time, :agent_id, :portal_id, :resonator_level
  json.url destroye_history_url(destroye_history, format: :json)
end
