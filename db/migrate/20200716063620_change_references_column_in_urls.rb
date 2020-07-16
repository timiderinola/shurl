class ChangeReferencesColumnInUrls < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :urls, :user_id, true
  end
end
