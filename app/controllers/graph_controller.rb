class GraphController < ApplicationController
  def index
  	@reports = Report.all
  	c5 = Array.new
  	c36 = Array.new

  	@reports.each do |c|
  		c5 << c.c5
  		c36 << c.c36
  	end 
  	p c5
  	p c36

    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'c5とc36の推移')
      f.xAxis(categories: c5)
      f.series(name: 'c36', data: c36, type: 'scatter')
    end

    @graph1 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'c5とc36の推移')
      f.xAxis(categories: c5)
      f.series(name: 'c36', data: c36, type: 'pie')
    end

    @graph2 = LazyHighCharts::HighChart.new('graph2') do |f|
      f.title(text: 'c5とc36の推移')
      f.xAxis(categories: c5)
      f.series(name: 'c36', data: c36, type: 'column')
    end
  end
end
