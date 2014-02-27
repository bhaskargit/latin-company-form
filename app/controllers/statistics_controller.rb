class StatisticsController < ApplicationController
	
	def index
		data_table = GoogleVisualr::DataTable.new

		# Add Column Headers 
		data_table.new_column('string', 'Year' ) 
		data_table.new_column('number', 'Sales') 
		data_table.new_column('number', 'Expenses') 

		# Add Rows and Values 
		data_table.add_rows([ 
	  ['2004', 1000, 400], 
	  ['2005', 1170, 460], 
	  ['2006', 660, 1120], 
	  ['2007', 1030, 540]])

	  option = { width: 400, height: 350 }
		
		 @bchart = GoogleVisualr::Interactive::BarChart.new(data_table, option)
		 @pchart = GoogleVisualr::Interactive::PieChart.new(data_table, option)
		 @lchart = GoogleVisualr::Interactive::LineChart.new(data_table, option)
		 @achart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)
		 @buchart = GoogleVisualr::Interactive::BubbleChart.new(data_table, option)
		 @cchart = GoogleVisualr::Interactive::ColumnChart.new(data_table, option)
	
	end
end
