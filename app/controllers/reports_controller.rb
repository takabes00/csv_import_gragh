class ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page]).per(25).order(:id)
  end

  def import_csv_new  
  end

  def import_csv
	respond_to do |format|
	  if Report.import_csv(params[:csv_file])
        format.html { redirect_to reports_path }
      else
        format.html { redirect_to reports_path, :notice => "CSVファイルの読み込みに失敗しました。" }
      end
    end
  end
end