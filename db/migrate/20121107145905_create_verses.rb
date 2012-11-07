class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.integer :number
      t.text :content
      t.references :chapter

      t.timestamps
    end
    add_index :verses, :chapter_id
  end
end
