class Book < ApplicationRecord
	belongs_to :user
  # 値が「2文字以上」である
    validates :title, length: { maximum: 200 }
    # 値が「2文字以上」である
    validates :body, length: { maximum: 200 }

    # presence で特定のカラムが空でないことをチェックします
	validates :body, presence: true
	validates :title, presence: true



end
