class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :link
      t.string :user

      t.timestamps
    end
  end
end
