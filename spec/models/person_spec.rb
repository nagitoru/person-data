require 'rails_helper'

RSpec.describe Person, type: :model do
  describe '新規記録' do
    before do
      @person = FactoryBot.build(:person)
    end

    context '新規記録がうまくいくとき' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@person).to be_valid
      end
      it 'hobbyが空でも保存できること' do
        @person.hobby = nil
        expect(@person).to be_valid
      end
      it 'emailが空でも保存できること' do
        @person.email = nil
        expect(@person).to be_valid
      end
    end

    context '新規記録がうまくいかないとき' do
      it 'first_nameが空だと登録できないこと' do
        @person.first_name = nil
        @person.valid?
        expect(@person.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角日本語でないと登録できないこと' do
        @person.first_name = 'suzuki'
        @person.valid?
        expect(@person.errors.full_messages).to include 'First name は漢字・ひらがな・カタカナのいずれかで入力してください'
      end
      it 'last_nameが空だと登録できないこと' do
        @person.last_name = nil
        @person.valid?
        expect(@person.errors.full_messages).to include "Last name can't be blank"
      end
      it 'lasr_nameが全角日本語でないと登録できないこと' do
        @person.last_name = 'taro'
        @person.valid?
        expect(@person.errors.full_messages).to include 'Last name は漢字・ひらがな・カタカナのいずれかで入力してください'
      end
      it 'first_name_readingが空だと登録できないこと' do
        @person.first_name_reading = nil
        @person.valid?
        expect(@person.errors.full_messages).to include "First name reading can't be blank"
      end
      it 'fist_name_readingが全角カタカナでないと登録できないこと' do
        @person.first_name_reading = 'すずき'
        @person.valid?
        expect(@person.errors.full_messages).to include 'First name reading はカタカナで入力してください'
      end
      it 'last_name_readingが空だと登録できないこと' do
        @person.last_name_reading = nil
        @person.valid?
        expect(@person.errors.full_messages).to include "Last name reading can't be blank"
      end
      it 'last_name_readingが全角カタカナでないと登録できないこと' do
        @person.last_name_reading = 'たろう'
        @person.valid?
        expect(@person.errors.full_messages).to include 'Last name reading はカタカナで入力してください'
      end
      it 'birthdayを選択していなければ登録できないこと' do
        @person.birthday = nil
        @person.valid?
        expect(@person.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'free_spaceが空では保存できないこと' do
        @person.free_space = nil
        @person.valid?
        expect(@person.errors.full_messages).to include "Free space can't be blank"
      end
    end
  end
end
