class AddOpeningToStories < ActiveRecord::Migration
  def change
    add_column :stories, :opening, :text
  end
end
