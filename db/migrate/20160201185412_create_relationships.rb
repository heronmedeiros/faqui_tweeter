class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships, id: false do |t|
      t.integer :follower_id #seguidor
      t.integer :followed_id #seguido

      t.timestamps null: false
    end
  end
end
