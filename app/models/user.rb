class User < ApplicationRecord
 	include Clearance::User

 	has_many :authentications, :dependent => :destroy
 	enum gender:[:undefined, :male, :female]

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(first_name: auth_hash["extra"]["raw_info"]["first_name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        birthday: Date.strptime(auth_hash["extra"]["raw_info"]["birthday"], '%m/%d/%Y')
      )

      user.authentications << (authentication)
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
	  
    def password_optional?
	    true
	end
end