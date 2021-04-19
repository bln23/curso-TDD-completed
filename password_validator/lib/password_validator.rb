module PasswordValidator
	def self.is_valid(password)
		when_contains_lowercase_characters(password)
		when_contains_capital_letters(password)
		when_contains_numbers(password)
		when_contains_underscore(password)
		when_contains_more_than_8_characters(password)
	end

	def self.when_contains_lowercase_characters(password)
		if password =~ /[a-z]/
			true
		end
	end

	def self.when_contains_capital_letters(password)
		if password =~ /[A-Z]/
			true
		end
	end

	def self.when_contains_numbers(password)
		if password.count("0-9") > 0
			true
		end
	end

	def self.when_contains_underscore(password)
		if password.include? "_"
			true
		end
	end

	def self.when_contains_more_than_8_characters(password)
		if password.length >= 9
			true
		end
	end
end
