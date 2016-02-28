def number_cuenta?(nc)
	flag = false
	if nc =~ /(\d{4})-(\d{3})-(\d{3})/
		flag = true
	end
	flag
end

def number_cuenta(nc)
	format = /(\d{4})-(\d{3})-(\d{3})/
	result = format.match(nc)
	unless result
		result = nil
	else
		result = result[0]
	end
	result
end

def array_number_cuenta(nc)
	array_result = []

	nc.split(' ').each do |word|
		if word =~ /(\d{4})-(\d{3})-(\d{3})/
			array_result << word
		end
	end
	array_result
end

def ocult_number_cuenta(nc)
	string_result = ''

	nc.split(' ').each_with_index do |word, index|
		string_result << ' ' if index != 0
		if word =~ /(\d{4})-(\d{3})-(\d{3})/
			word[0..3] = "XXXX"
			word[5..7] = "XXX"
		end
		string_result << word
	end
	string_result
end

def format_number_cuenta(nc)
	string_result = ''

	nc.split(' ').each_with_index do |word, index|
		string_result << ' ' if index != 0
		if word =~ /(\d{10})/ || word =~ /(\d{4}).(\d{3}).(\d{3})/
			word_t = word.delete('.')
			word = word_t[0..3]+"-"+word_t[4..6]+"-"+word_t[7..9]
		end
		string_result << word
	end
	string_result
end

nc = "Esta es una cuenta: 1234-123-123"
p number_cuenta?(nc)
p number_cuenta(nc) == "1234-123-123"
p array_number_cuenta("1234-123-123 4431-323-423 7344-333-423") == ['1234-123-123','4431-323-423','7344-333-423']
p ocult_number_cuenta(nc) == "Esta es una cuenta: XXXX-XXX-123"

nc = "Esta es una cuenta: 1234.123.123"
p format_number_cuenta(nc) == "Esta es una cuenta: 1234-123-123"