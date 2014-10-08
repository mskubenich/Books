class Book < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :genres

  validates :title, presence: true

  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: ["application/epub+zip"] }
end
