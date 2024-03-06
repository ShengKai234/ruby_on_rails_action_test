class CreateVoteLogs < ActiveRecord::Migration
  def change
    create_table :vote_logs do |t|
      t.references :candidate, index: true, foreign_key: true
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
