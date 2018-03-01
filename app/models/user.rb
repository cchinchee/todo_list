
class User < ApplicationRecord
	include BCrypt
	include ApplicationHelper
	has_secure_password
	has_many :tasks , dependent: :destroy
	enum role: { uncompleted: 0, completed: 1}
	
end
