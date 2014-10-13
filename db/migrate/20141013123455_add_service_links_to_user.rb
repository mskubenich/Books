class AddServiceLinksToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :google, :string
    add_column :users, :github, :string
    add_column :users, :vkontakte, :string
  end
end
