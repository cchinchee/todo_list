class Task < ApplicationRecord
	require 'date'
	belongs_to :user
	validates :start_date, :title, presence: true
	enum status: { uncompleted: 0, completed: 1}
end
