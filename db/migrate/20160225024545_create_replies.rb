class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.date :date_posted
      t.text :content

      t.timestamps null: false
    end
  end
end
