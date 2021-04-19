module FizzBuzz
	def self.print_fizz
		list_of_mumbers = (1..100).to_a

		list_of_mumbers.map do |number|
			if number % 3 == 0 && number % 5 == 0
				'FizzBuzz'
			elsif number % 3 == 0
				'Fizz'
			elsif number % 5 == 0
				'Buzz'
			else
				number
			end
		end
	end
end
