class User < ActiveRecord::Base

  validates :email, :uniqueness => true
  validates :name, :email, :password, :presence => true
  validates_confirmation_of :password, message: 'passwords should match'

  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    user = self.find_by_email(email)
    if user && (user.password == password)
      user
    else
      false
    end
  end

end