class RemoveUserFromStory < ActiveRecord::Migration
  def change
    remove_column :stories, :user, :string
  end
end
