class User < ApplicationRecord
  validates :lname, :fname, :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 105},
    uniqueness: {case_sensative:false}, 
    format: {with: VALID_EMAIL_REGEX}
  
  validates :thumbnail, allow_blank: true,
  format: {with: /^.*\.(jpg|JPG|jpeg|JPEG|gif|GIF|pdf|PDF)$/g,
  message: 'must be a URL for GIF, JPG or PNG image.'}
  
  has_many :bugs
end
