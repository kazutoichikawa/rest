# README
# アプリケーション名
Re:ST!

# アプリケーション概要
飲食店予約サービス
○ユーザーができること
飲食店の検索
飲食店の利用予約
飲食店のレビュー

○オーナーができること
店のページを作成・編集・削除

# URL
https://rest-32531.herokuapp.com/

# テスト用アカウント
○通常アカウント
ID: sample@sample.jp
Password: sample11

○管理者用アカウント
email:admin@example.jp
Password: admin11

# 利用方法
サインイン
→左の検索フォームより店舗検索
→店舗詳細ページに移動
→最下段の予約フォームから日時、人数を入力し店舗を予約
→ヘッダーから予約状況を確認

# 目指した課題解決
○20代~40代の穴場レストランに行ってみたいという潜在ニーズの解消  
消費者がSNSで見た物。感じた物を投稿できる時代、有名なものはSNSに溢れています。  
消費者の潜在ニーズは「穴場、こだわり、特徴のある店」に移っていると感じました。  
そこで予算やジャンルだけではなく店や料理人のストーリーから店舗を検索できるアプリを制作することで、上記課題を解決を試みたいと考えました。  

○自分の店にこだわりのあるオーナーの収益改善  
SNSの普及で広告業界は大きく変化しました。広告量、媒体の種類ともに急増しています。  
そんなご時世で、飲食店予約システムは広告宣伝費を捻出できる大手飲食店が上欄の目に移りやすい箇所に位置し、本当にこだわりのある穴場的な店は知る人ぞ知るというのが現状です。  
そんな本気で飲食に努めるこだわりあるオーナーの収益改善も本アプリの開発を通じて解決できればと考えています。  

○まとめ  
「穴場を求めるユーザーと、こだわりを持つオーナーのマッチング」というニーズが満たされていないという現状の課題の解決が本アプリの目的です。  

# 要件定義
○ユーザー管理機能  
サインアップ/サインイン/サインアウトに加え、管理者用アカウントが登録されています。  
○店舗情報投稿機能  
○店舗一覧表示機能  
○店舗編集機能  
○店舗削除機能  
○店舗検索機能  
エリア、ジャンル、タグで複数条件で絞り込み  
○店舗予約機能  
○予約状況確認機能  
○レビュー投稿機能  
○店舗情報投稿/編集/削除機能(管理者向け)  

# テーブル設計

## User テーブル
| Column   | Type    |Options                    |
| -------- | ------- | ------------------------- |
| name     | string  | null:false                |
| f_name   | string  | null:false                |
| l_name   | string  | null:false                |
| f_name_r | string  | null:false                |
| l_name_r | string  | null:false                |
| email    | string  | null: false, unique:true  |
| password | string  | null:false                | 
| birthday | date    | null:false                |
| p_num    | string  | null:false                |
| admin    | boolean |                           |

### Association
- has_many :shops
- has_many :reservations
- has_many :reviews

## shop テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| shop_name     | string     | null: false |
| genre_id      | integer    | null: false |
| profile       | text       | null: false |
| p_num         | string     | null: false |
| p_code        | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| user          | references | null:false  |

### Association
- belongs_to :user
- has_many :reservations
- has_many :reviews
- has_many :shop_tag_relations
- has_many :tags, through: :shop_tag_relations


## Tags テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |

### Association
- has_many :shop_tag_relations
- has_many :shops, through: :shop_tag_relations

## Reviews テーブル
| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | integer    |             |
| shop_id | integer    |             |
| text    | text       | null: false |

### Association
- belongs_to :shop
- belongs_to :user

## ShopTagRelations テーブル
| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| shop    | references | foreign_key: true |
| tag     | references | foreign_key: true |

### Association
- belongs_to :shop
- belongs_to :tag

## Reservations テーブル
| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| date     | date       | null: false |
| time     | time       | null: false |
| n_people | integer    | null: false |
| user     | references | null: false |
| shop     | references | null: false |

### Association
- belongs_to :shop
- belongs_to :user

# ローカルでの動作方法
