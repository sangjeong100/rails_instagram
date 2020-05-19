class AddProfilePhotoToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_photo, :string
    add_column :users, :phone_number, :string, :default => ""
    add_column :users, :user_name, :string, :default => ""
  end
end
