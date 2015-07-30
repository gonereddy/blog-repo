class Team < ActiveRecord::Base
	mount_uploader :photo, AvatarUploader
	has_many :blogs
end
