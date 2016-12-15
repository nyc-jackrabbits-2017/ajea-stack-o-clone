class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count, null: false
      t.references :user, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false

      t.timestamps(null: false)
    end
  end
end
