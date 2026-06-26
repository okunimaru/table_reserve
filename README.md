# TableReserve

飲食店向けの予約管理システムです。お客様の予約受付から、店舗側での承認・管理までを一元化できます。

## 概要

小規模な飲食店（バー・レストラン等）を想定した予約システムです。
フロア（席）選択や事前オーダー機能により、店舗側の業務効率化と来店前の食材準備（フードロス削減）を支援します。

実在の店舗（松江市のダイニングバー）の運営課題をヒントに、汎用的に使える設計にしています。

## 主な機能

### お客様向け
- 会員登録・ログイン
- フロア（席）を選んでの予約申請
- メニューの事前オーダー（任意）
- 自分の予約一覧の確認

### 店舗（管理者）向け
- 予約一覧の確認
- 予約の承認・却下
- メニュー管理（登録・編集）

## 使用技術

| カテゴリ | 技術 |
|---|---|
| バックエンド | Ruby on Rails 7.2 |
| 言語 | Ruby 3.3 |
| データベース | PostgreSQL 16 |
| インフラ | Docker / Docker Compose |
| フロントエンド | HTML / ERB / CSS |

## ER図（テーブル構成）

- `users`：会員情報（customer / admin の権限を持つ）
- `floors`：フロア（席）情報
- `reservations`：予約情報
- `menus`：メニュー情報
- `reservation_menus`：予約とメニューの中間テーブル（事前オーダー管理）

## ローカル環境での起動方法

### 前提条件
- Docker / Docker Compose がインストールされていること

### セットアップ

```bash
git clone https://github.com/okunimaru/table_reserve.git
cd table_reserve
docker compose build
docker compose up
```

別ターミナルでデータベースを準備します。

```bash
docker compose exec web rails db:create db:migrate
```

`http://localhost:3000` にアクセスしてください。

### 開発用テストデータの作成

ログイン確認用に、以下のコマンドでテストユーザーを作成できます。

```bash
docker compose exec web rails c
```

```ruby
User.create(name: "テストユーザー", email: "test@example.com", password: "password", role: "customer")
User.create(name: "管理者", email: "admin@example.com", password: "password", role: "admin")
```

メニューのサンプルデータも作成できます。

```ruby
Menu.create(name: "ビール", description: "生ビール", price: 600)
Menu.create(name: "ハイボール", description: "ウイスキーハイボール", price: 500)
Menu.create(name: "唐揚げ", description: "自家製唐揚げ", price: 800)
```

## 開発背景

Ruby on Railsへの転向後、実務とは別に「Docker + PostgreSQL」構成での開発経験を積むことを目的として個人開発しました。
認証機能（ログイン・権限管理）、has_many throughによる多対多のアソシエーション、ネストされたフォーム（事前オーダー）の実装などを通じて、実務に近い設計を意識しています。

## 今後の実装予定

- 予約のキャンセル機能
- メニューのカテゴリ分け
- 予約可能時間帯の制御

## 作者

國井 真史
GitHub: [okunimaru](https://github.com/okunimaru)