class AddIndexToVisits < ActiveRecord::Migration[5.0]
  add_index :visits, :visitor_id
  add_index :visits, :short_url_id
end
