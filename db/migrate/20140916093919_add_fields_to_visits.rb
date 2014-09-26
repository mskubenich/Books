class AddFieldsToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :latitude, :string
    add_column :visits, :longitude, :string
  end
end
