class AddUserToResume < ActiveRecord::Migration[6.1]
  def change
    add_reference :resumes, :user, index: true
  end
end
