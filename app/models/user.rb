class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects

  has_many :bugs 
  # has_many :bug_developers, dependent: :destroy

  has_many :usersprojects, dependent: :destroy
  has_many :projects, through: :usersprojects
  enum user_type: [:projectmanager, :qa, :developer]

end
