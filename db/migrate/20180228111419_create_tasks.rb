class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
    	t.string :title, null: false
    	t.text :description
    	t.integer :status, default: 0
    	t.references :user, foreign_key: true
    	t.date :start_date, null:false
      t.timestamps null: false
    end
  end
end
