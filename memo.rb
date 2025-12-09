require "csv"

# メニュー入力（1 or 2 以外は再入力）
memo_type = nil
loop do
  puts "1（新規でメモを作成） / 2（既存のメモを編集）"
  print "番号を入力してください → "
  memo_type = gets.to_i

  if memo_type == 1 || memo_type == 2
    break
  else
    puts "不正な値です。1か2を入力してください。"
  end
end

# 新規でメモを作成する（1）
if memo_type == 1
  puts "新規ファイル名を入力してください（拡張子なし）"
  file_name = gets.chomp

  puts "内容を入力してください。（Ctrl + D で保存）" #Ctrl+D または環境によっては Ctrl+Z
  input_text = $stdin.read   
  memo_lines = input_text.split("\n") 

  CSV.open("#{file_name}.csv", "w") do |csv|
    memo_lines.each do |line|
      csv << [line]
    end
  end

  puts "新規メモを保存しました！"

# 既存のメモを編集する（2）
elsif memo_type == 2
  puts "編集するファイル名を入力してください（拡張子なし）"
  file_name = gets.chomp

  puts "追記内容を入力してください。（Ctrl + D で保存）" #Ctrl+D または環境によっては Ctrl+Z
  input_text = $stdin.read
  memo_lines = input_text.split("\n")  # 行ごと追加

  CSV.open("#{file_name}.csv", "a") do |csv|
    memo_lines.each do |line|
      csv << [line]
    end
  end

  puts "メモを追記しました！"
end
