class RemoveApiTokenFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :api_token, :string
  end
end
