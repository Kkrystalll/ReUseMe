class Resume < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  scope :published, ->{ where(status: "published") }
  scope :draft, ->{ where(status: "draft") }
  

  def self.all_status
    [["草稿",:draft],["發佈",:published]]
  end
end
