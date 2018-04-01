class Task < ApplicationRecord
	require 'date'
	belongs_to :category
	enum status: { uncompleted: 0, completed: 1}
end
