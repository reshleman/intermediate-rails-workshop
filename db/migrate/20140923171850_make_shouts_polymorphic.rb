class MakeShoutsPolymorphic < ActiveRecord::Migration
  def change
    remove_column :shouts, :body, :string
    add_column :shouts, :content_type, :string
    add_column :shouts, :content_id, :integer
    add_index :shouts, [:content_type, :content_id]
  end
end
