class Changeuseridnull < ActiveRecord::Migration[6.0]
  def change
      change_column_null :organizations, :user_id, true
  end
end
