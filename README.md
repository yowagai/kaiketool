# アプリケーション名
------------------ 
かいけつ〜る  

# アプリケーション概要
------------------ 
子供のなぜなぜ期などで悩んでいる親やその子供の悩みを解消することができる。
  
# URL
------------------ 
（https://kaiketool.onrender.com）  

# テスト用アカウント
------------------ 
・Basic認証パスワード：2221  
・Basic認証ID：aadmin  
・メールアドレス：  
・パスワード：  

# アプリケーションを作成した背景
------------------ 
自身の子供が今なんでも聞いてくるなぜなぜ期到来中です。母親は、受け答えに困ってイライラしてしまうこともあります。そこで、他の子育て世代の親たちもそんななぜなぜ期でイライラしてしまう経験があるのではないかと仮説を立てました。周りにヒアリングしたところ、悩みを抱えている方も多いと推測し、他の子供のなぜなぜもユーザー同士共有してコミュニケーションの場としても使えるアプリケーションを開発することにしました。  

# 洗い出した要件
------------------ 
要件を定義したシート  （https://docs.google.com/spreadsheets/d/1UUPdMAMZNTHUXTNeurIpLWI-mFuVkW2Jd6XsSVwnK_c/edit#gid=1477306112）
  
# 実装した機能についての画像やGIFおよび説明
------------------ 
  
# 実装予定の機能
------------------ 
現在音声入力から文字起こしをストリーミングで読み込み方法を実装中。
今後は、画像のAI認識機能を入れて、親が使いやすいように文章説明機能を入れたいです。
さらに追加として、コメント機能やいいねなどのスタンプを簡単に押せるような機能を実装したいです。
  
# データベース設計
------------------ 
[![Image from Gyazo](https://i.gyazo.com/0f056340b7104ce3216aae0a2b53d451.png)](https://gyazo.com/0f056340b7104ce3216aae0a2b53d451)
  
# 画面遷移図
------------------ 
  
# 開発環境
------------------ 
### バックエンド  
・Ruby 3.0.2  
・Rails 6.1.3  
  
### フロントエンド  
・HTML  
・CSS(SCSS)  
・JavaScript(jQuery)  
  
### インフラ  
・render  
  
### テスト  
・rspec  
・rubocop  
  
### テキストエディタ  
・Visual Studio Code  
  
### タスク管理  
・Github  
  


# ローカルでの動作方法
------------------ 
  
# 工夫したポイント
------------------ 
子供向けのポータルサイトを確認したところ、デザインが昔のままで、直感的ではありませんでした。当サイトは、やりたいことがはっきりわかるように、あまり無駄なものを入れず直感的に作りました。その代わり、子供が使うことを考えて、アニメーションを多用しました。また、現在の技術ではAIの画像認識をさせる部分が実装できなかったので、代替物としてキーワードで画像を呼び起こして、視覚的に判断してもらうものを作成しました。  
  

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| child_name         | string  | null: false               |
| child_name_kana    | string  | null: false               |
| parent_name        | string  | null: false               |
| parent_name_kana   | string  | null: false               |
| sex_id             | integer | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :search_histories
- has_many :comments
- has_many :stamps
- has_many :favorites

## search_histories テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false                    |
| background         | text       |                                |
| type_id            | integer    |                                |

### Association

- belongs_to :user
- has_many :comments
- has_many :stamps
- has_many :favorites

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| search_histories   | references | null: false, foreign_key: true |
| content            | text       |                                |

### Association

- belongs_to :user
- belongs_to :search_histories

## stamps テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| search_histories   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :search_histories

## favorites テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| search_histories   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :search_histories