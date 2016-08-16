class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  serialize :following, Array 
  
  has_many :tweets

  before_create :prepend_at_symbol


 	private def prepend_at_symbol
  	self.username.prepend("@")
 	end
end
