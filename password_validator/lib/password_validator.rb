module PasswordValidator
	def self.is_valid(password)
		when_contains_lowercase_characters(password) &&
		when_contains_capital_letters(password) &&
		when_contains_numbers(password) &&
		when_contains_underscore(password) &&
		when_contains_more_than_8_characters(password)
	end

	def self.when_contains_lowercase_characters(password)
		password =~ /[a-z]/
	end

	def self.when_contains_capital_letters(password)
		password =~ /[A-Z]/
	end

	def self.when_contains_numbers(password)
		password.count("0-9") > 0
	end

	def self.when_contains_underscore(password)
		password.include? "_"
	end

	def self.when_contains_more_than_8_characters(password)
		password.length >= 9
	end
end
