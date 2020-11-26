class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.integer :id, null: false
      t.string :sender_name, null: false
      t.string :sender_email, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.datetime :send_time, null: false
    end

    add_index :emails, :id, unique: true
  end
end
