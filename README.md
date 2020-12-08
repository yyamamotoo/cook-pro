# COOK PRO
本格レシピに特化したアプリケーションです。

# 利用方法
ユーザー登録なしでレシピの詳細確認ができます。<br>
ユーザー登録をして頂けますと、コメント機能を使用できるようになり代替食品の確認、コツなどをレシピ投稿者に聞く事ができます。

# このアプリの考える役割
家で過ごす事が増えてきた今、楽しく、より贅沢な時間を過ごすためのアプリです。<br>
料理の楽しさに気づき始めた時、既存のサイトを巡ってみてもあまり本格なレシピが投稿されているサイトはありません。<br>
また、本格と謳っていてもなんちゃってなレシピな事が多々あります。<br>
せっかく料理の楽しさを理解し始め本格な物に挑戦しようと思ってもこれでは挑戦ができずにやる気がなくなってしまう可能性があります。<br>
そんな時にこのアプリを使って頂いて、いろんな本格レシピに挑戦していただければと思います。<br>
本格レシピをみたいならレシピ本を買えば良いではと思う方もいらっしゃると思いますが、まだ極めていきたいジャンルを絞れていない時に
レシピ本を買い集めて挑戦していくとなると結構な出費になってしまいます。<br>
そんな方の手助けにもなればいいなと思っています。

# 要件

|優先順位(高:3中:2低:1)|     機能     |                 目的                       |                      詳細                   |
|-------------------|--------------|-------------------------------------------|---------------------------------------------|
|3                  |  商品検索機能  | 条件を指定した上で購入したい商品の検索を可能にする | ・レシピは数点出品されていることが前提            |
|                   |              |                                            | ・レシピ名、ジャンルの検索条件を指定する欄を儲ける  |
|                   |              |                                            | ・条件に該当するレシピは検索結果のページで表示する  |
|2                  | コメント機能   | ユーザーが気になる情報を聞けるようにする          | ・レシピ詳細ページにコメント欄を設置              |
|                   |              |                                            | ・レシピ投稿者のコメントとユーザーコメントの区別を   |
|                   |              |                                            |   わかりやすくするため、投稿者と、  　　          |
|                   |              |                                            |   ユーザーの表示名の色を変える                   |

# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |


### Association

- has_many :recipes
- has_many :comments

## recipes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| video       | string     | null: false                    |
| title       | string     | null: false                    |
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :materials
- has_many :chefs

## materials テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| vegetable   | string     | null: false                    |
| amount      | string     | null: false                    |
| recipe      | references | null: false, foreign_key: true |


### Association

- belongs_to :recipe

## chefs テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| cook        | string     | null: false                    |
| recipe      | references | null: false, foreign_key: true |


### Association

- belongs_to :recipe


## comments テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| recipe | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe

# 動作環境

- Ruby: 2.3.1
- Rails: 5.0.1
- DB: Mysql

### 実装準備
- rails db:create
- rails db:migrate
- rails db:seed