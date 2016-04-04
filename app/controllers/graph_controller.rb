class GraphController < ApplicationController
  def index
    @reports = StandardFormatDatum.select("男女区分","身長","体重","総コレステロール").page(params[:page]).per(25).order(:"身長")
  	c1 = Array.new
  	c2 = Array.new
    c3 = Array.new
    c4 = Array.new

  	@reports.each do |c|
  		c1 << c.男女区分
  		c2 << c.身長
      c3 << c.体重
      c4 << c.総コレステロール
  	end 

    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '身長の推移')
      f.xAxis(categories: c1)
      f.series(name: '身長', data: c2, type: 'scatter')
    end

    @graph1 = LazyHighCharts::HighChart.new('graph1') do |f|
      f.title(text: '体重の推移')
      f.xAxis(categories: c1)
      f.series(name: '体重', data: c3, type: 'pie')
    end

    @graph2 = LazyHighCharts::HighChart.new('graph2') do |f|
      f.title(text: '総コレステロールの推移')
      f.xAxis(categories: c1)
      f.series(name: '総コレステロール', data: c4, type: 'column')
    end
  end
end
