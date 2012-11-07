class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :number
      t.string :link
      t.references :book

      t.timestamps
    end
    add_index :chapters, :book_id
  end
end
