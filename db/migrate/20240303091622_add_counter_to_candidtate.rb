class AddCounterToCandidtate < ActiveRecord::Migration
  def change
    add_column :candidates, :vote_logs_count, :integer
  end
end
