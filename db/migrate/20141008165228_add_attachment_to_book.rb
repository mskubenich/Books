class AddAttachmentToBook < ActiveRecord::Migration
  def self.up
    add_attachment :books, :attachment
  end

  def self.down
    remove_attachment :books, :attachment
  end
end
