require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
  puts "新規作成したいファイル名を拡張子抜きで入力してください"
  new_file = gets.chomp
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + D をクリックしてください"
  new_contents = readlines(rs ="\n", chomp: true)
  CSV.open(new_file+'.csv','w') do |csv|
    csv << new_contents
  end
elsif memo_type == 2
  puts "編集したいファイル名を拡張子抜きで入力してください"
  edit_file = gets.chomp
  puts "追記したい内容を記入してください"
  puts "完了したらCtrl + D をクリックしてください"
  add_contents = readlines(chomp: true)
  CSV.open(edit_file+'.csv', 'a') do |csv|
    csv << add_contents
  end
end