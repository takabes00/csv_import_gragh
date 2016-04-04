module StandardFormatDataHelper

	def basho(value)
		if value == 14
			"石川県"
		elsif value == 24
			"西宮市"
		elsif value == 29
			"福岡市"
		elsif value == 30
			"佐賀県"
		elsif value == 44
			"同友会"
		elsif value == 54
			"臼杵市"
		elsif value == 55
			"生光会"
		elsif value == 67
			"宗像市"
		elsif value == 80
			"半田市"

		end
	end

	def danjo(value)
		if value == 1
			"男"
		elsif value == 2
			"女"
		end
	end

	def nenrei(value)
		return value if value.nil?

		today = Date.today
		age = today.year - value.year
		if today.month < value.month or (today.month == value.month and today.day < value.day)
			age -= 1
		else 
			age
		end
	end
end
