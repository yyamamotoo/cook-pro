# COOK PRO
簡単レシピと本格レシピを簡単に比較できるアプリケーションです。

# 利用方法
ユーザー登録なしでレシピの詳細確認ができます。
簡単レシピ、本格レシピの各ページには同じ料理の簡単レシピ、本格レシピのページにすぐ行けるようになっています。
ユーザー登録をして頂けますと、お気に入り機能を使用でき、ユーザーページにてお気に入りされたレシピが一覧で表示されます。
また、コメント機能も使用できるようになり代替食品の確認、コツなどをレシピ投稿者に聞く事ができます。

# このアプリの考える役割
家で過ごす事が増えてきた今、楽しく、より贅沢な時間を過ごすためのアプリです。
一人暮らしの方やご家庭でご飯を作らなければいけない時があると思います。
しかし、料理があまり好きではない、得意ではない人はたくさんいらっしゃると思います。
そんな方にまずは簡単なレシピで料理をして頂き、こんなに簡単に料理ってできるんだ、
簡単に作っても美味しくできるんだ、思っていたよりも簡単だしもう少しやってみたいなと思って頂けたらと思っています。
もしそう思って頂けた時に、本格レシピをすぐに見る環境があればもっと料理に興味を持って頂けるのではないのかと考えました。
簡単レシピと本格レシピを食べ比べした時に、調味料一つで変わる味わい、一手間の違い、素材の大切さを実感できると思います。
そうやって色々な料理を食べ比べして頂きながら、料理の楽しさ、手間をかけた料理の贅沢さを感じて頂ければと思っています。

# 要件

|優先順位             |機能｜目的｜詳細｜ストーリー(ユースケース)｜
|(高：3、中：2、低：1) |    |    |    |                     |
|-------------------|----|----|----|---------------------|
|3                  |商品検索機能|



# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birth_date            | date   | null: false |


### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| info                        | text       | null: false                    |
| item_category_id            | integer    | null: false                    |
| item_sales-status_id        | integer    | null: false                    |
| item_shipping-fee-status_id | integer    | null: false                    |
| item_prefecture_id          | integer    | null: false                    |
| item_scheduled-delivery_id  | integer    | null: false                    |
| price                       | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchaser

## deliveries テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| addresses           | string     | null: false                    |
| building            | string     |                                |
| phone_number        | string     | null: false                    |
| purchaser           | references | null: false, foreign_key: true |

### Association

- belongs_to :purchaser

## purchasers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :deliverie
