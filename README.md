# README
# アプリケーション名
Re:ST!

# アプリケーション概要
飲食店予約サービス
○ユーザーができること
飲食店の検索
飲食店の予約飲食店の代金決済
飲食店のレビュー

○オーナーができること
自分の店のページを作成・編集・削除

# URL
デプロイ後記述

# テスト用アカウント
ユーザー管理機能実装後記述

# 目指した課題解決
○20代~40代の穴場レストランに行ってみたいという潜在ニーズの解消
消費者がSNSで見た物。感じた物を投稿できる時代、世の中の飲SNSで有名なものは消費者の目に目新しさを感じさせることはできない。
消費者の潜在ニーズは「穴場、こだわり、特徴のある店」を求めている。
そこで予算やジャンルだけではなく店や料理人のストーリーから店舗を検索できるアプリを制作することで、上記課題を解決を試みた。

○自分の店にこだわりのあるオーナーの収益改善
SNSの普及で広告業界は大きく変わった。広告量、媒体の種類ともに急増した。
そんなご時世で、飲食店予約システムは広告宣伝費を捻出できる大手飲食店が上欄の目に移りやすい箇所に位置し、本当にこだわりのある穴場的な店は知る人ぞ知るというのが現状である。
そんな本気で飲食に努めるこだわりあるオーナーの収益改善も本アプリの目的である。

○まとめ
「穴場を求めるユーザーと、こだわりを持つオーナーのマッチング」というニーズが満たされていないという現状の課題の解決を目指したのが本アプリである。

# 要件定義
○ユーザー管理機能
サインアップ/サインイン/サインアウト
ユーザー用アカウント、オーナー用アカウントで分離

○店舗検索機能
ストーリー、予算、エリアで分岐

○店舗予約機能

○代金決済機能
クレジットカードのみ、ポイントが付く仕様

○店舗評価機能
高評価者には似た店をジャンルの店を表示しおすすめ
低評価者には違うジャンルの店を表示しおすすめ

○店舗情報投稿/編集/削除機能(オーナー向け)

# 実装した機能についてのGIFと説明
実装後記述

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
| owner    | boolean |                           |

### Association
- has_many :shops
- has_many :buy_users
- has_many :reviews

## shop テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| shop_name     | string    | null: false |
| genre_id      | integer   | null: false |
| profile       | text      | null: false |
| p_code        | string    | null: false |
| prefecture_id | integer   | null: false |
| city          | string    | null: false |
| address       | string    | null: false |
| building      | string    |             |
| user          | references | null:false |

### Association
- belongs_to :user
- has_many :menus
- has_many :staffs
- has_many :reviews

## Staff テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| staff_name   | string     | null: false |
| profile      | text       | null: false |

### Association
- belongs_to :shop

## Menu テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| title        | string     | null: false |
| type         | string     | null: false |
| price        | integer    | null: false |
| detail       | text       | null: false |

### Association
- belongs_to :shop
- has_one :buy_user

## BuyUser テーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references | null: false |
| menu      | references | null: false |

### Association
- belongs_to :user
- belongs_to :menu

## Review テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| star_id | integer    |                                |
| comment | text       |                                |


### Association
- belongs_to :shop
- belongs_to :user

# ローカルでの動作方法
