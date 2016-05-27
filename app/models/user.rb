class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           
  belongs_to :gamer
  
  after_create :create_gamer
  
  def create_gamer
    gamer = Gamer.create
    gamer.gamer_tag = self.email
    gamer.save
    self.gamer = gamer
    self.save
  end
end
