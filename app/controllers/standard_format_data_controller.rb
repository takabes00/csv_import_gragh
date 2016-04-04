class StandardFormatDataController < ApplicationController
  def index
    @count = StandardFormatDatum.count
    @reports = StandardFormatDatum.select("男女区分","生年月日","医療機関コード","身長","体重","総コレステロール").page(params[:page]).per(25).order(:"身長")
  end

  def import_csv_new  
  end

  def import_csv
	respond_to do |format|
	  if StandardFormatData.import_csv(params[:csv_file])
        format.html { redirect_to standard_format_data_path }
      else
        format.html { redirect_to standard_format_data_path, :notice => "CSVファイルの読み込みに失敗しました。" }
      end
    end
  end
end