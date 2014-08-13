class CreateBooksAndGenres < ActiveRecord::Migration
  def change
    create_table :books_genres do |t|
      t.belongs_to :book, index: true
      t.belongs_to :genre, index: true
    end
  end
end
