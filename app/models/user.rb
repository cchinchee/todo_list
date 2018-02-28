
class User < ApplicationRecord
	include BCrypt
	include ApplicationHelper
	has_secure_password
end
