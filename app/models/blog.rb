class Blog < ActiveRecord::Base
mount_uploader :avatar, AvatarUploader
	extend FriendlyId
  friendly_id :name, use: :slugged
# This method associates the attribute ":avatar" with a file attachment
  # has_attached_file :avatar, styles: {
  #   thumb: '100x100>',
  #   square: '200x200#',
  #   medium: '300x300>'
  # }

  # # Validate the attached image is image/jpg, image/png, etc
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  belongs_to :team, :foreign_key => 'team_id'
end
