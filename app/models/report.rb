require 'csv'   # csv操作を可能にするライブラリ
require 'kconv' # 文字コード操作をおこなうライブラリ

class Report < ActiveRecord::Base

  def self.import_csv(csv_file)
    # csvファイルを受け取って文字列にする
    csv_text = csv_file.read
      
    data = []

    #文字列をUTF-8に変換
    CSV.parse(Kconv.toutf8(csv_text)) do |row|

      report = Report.new
      report.c5     = row[3]  #csvの1列目を格納
      report.c36    = row[34]  #csvの2列目を格納
      report.c37    = row[35]  #csvの2列目を格納
      report.c38    = row[36]  #csvの3列目を格納
      report.c41    = row[39]  #csvの4列目を格納
      report.c83    = row[81]  #csvの4列目を格納
      report.save
    end
  end
end