class Class_telephone

	def initialize(telephone)
		@telephone = telephone
	end

	def format_telephone
		result_phone = ''
		times = @telephone.length/4
		telephone_result = ''
		times.times do |time| 
			result_phone << @telephone[(time*4)..(((time+1)*4)-1)] + "-"
		end
		result_phone << @telephone[(times*4)..(@telephone.length-1)]
		result_phone
	end

	def format_telephone!
		result_telephone = format_telephone
		@telephone = result_telephone
	end
end

telephone = Class_telephone.new("12345643422")
p telephone.format_telephone
p telephone.format_telephone!