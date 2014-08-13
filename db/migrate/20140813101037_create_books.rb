class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.references :author, index: true
      t.references :genre, index: true
      t.integer :year
      t.integer :pages
      t.string :format
      t.string :language
      t.integer :size

      t.timestamps
    end
  end
end
