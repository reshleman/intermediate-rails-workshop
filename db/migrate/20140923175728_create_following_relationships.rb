class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.references :follower, index: true
      t.references :followed_user, index: true

      t.timestamps
    end
  end
end
