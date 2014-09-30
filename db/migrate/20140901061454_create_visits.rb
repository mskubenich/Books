class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :ip
      t.string :browser
      t.string :browser_version
      t.string :os_name
      t.string :os_version
      t.string :device
      t.timestamps 
    end
  end
end