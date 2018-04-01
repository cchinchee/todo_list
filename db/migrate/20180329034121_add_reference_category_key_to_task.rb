class AddReferenceCategoryKeyToTask < ActiveRecord::Migration[5.1]
  def change
  	add_reference :tasks, :category, foreign_key: true
  	end
end
