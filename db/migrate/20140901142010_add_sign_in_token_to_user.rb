class AddSignInTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :sign_in_token, :string
  end
end
