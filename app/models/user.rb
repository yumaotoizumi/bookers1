class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :books ,dependent: :destroy

	attachment :image
	validates :name, presence: true
	# 値が「2文字以上、20文字以下」である
	validates :name, length: { in: 2..20 }



	validates :introduction, length: { maximum: 50 }

end
