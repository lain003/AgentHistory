json.array!(@deploy_histories) do |deploy_history|
  json.extract! deploy_history, :id, :ident_code, :action_time, :agent_id, :portal_id, :resonator_level
  json.url deploy_history_url(deploy_history, format: :json)
end
