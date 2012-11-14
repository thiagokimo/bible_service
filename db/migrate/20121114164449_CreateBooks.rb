class Createbooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :title
      t.string :link
      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
