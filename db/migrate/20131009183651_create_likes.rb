class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :liker, index: true
      t.references :likee, index: true

      t.timestamps
    end
  end
end
