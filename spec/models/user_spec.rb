require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'cild_name,child_name_kana,parent_name,parent_name_kana,sex_id,birtthday,email、password,password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '12345あ'
        @user.password_confirmation = '12345あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'child_nameが空では登録できない' do
        @user.child_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Child name can't be blank")
      end
      it 'child_nameに半角文字が含まれていると登録できない' do
        @user.child_name = '佐藤a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Child name is invalid')
      end
      it 'child_name_kanaが空だと登録できない' do
        @user.child_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Child name kana can't be blank")
      end
      it 'child_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.child_name_kana = 'さとう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Child name kana is invalid')
      end
      it 'parent_nameが空だと登録できない' do
        @user.parent_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Parent name can't be blank")
      end
      it 'parent_nameに半角文字が含まれていると登録できない' do
        @user.parent_name = '太郎a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Parent name is invalid')
      end
      it 'parent_name_kanaが空だと登録できない' do
        @user.parent_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Parent name kana can't be blank")
      end
      it 'parent_name_kaneにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.parent_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Parent name kana is invalid')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'sex_idが空では登録できない' do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Sex を選択して下さい')
      end

    end
  end
end
