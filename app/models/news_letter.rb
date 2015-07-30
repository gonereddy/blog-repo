class NewsLetter < ActiveRecord::Base
	validates_uniqueness_of :email
	validates  :email , :presence => true ,
	:length => {:minimum => 3,:maximum => 254},
	:format => {:with => /\A^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$\z/i}
end
