class Resume < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def self.all_status
    [["草稿",:draft],["發佈",:published]]
  end
end
