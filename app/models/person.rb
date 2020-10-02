class Person < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字・ひらがな・カタカナのいずれかで入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字・ひらがな・カタカナのいずれかで入力してください' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
    validates :birthday
    validates :free_space
  end

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
