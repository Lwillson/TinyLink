class Link < ActiveRecord::Base
	ALPHABET = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).join
	N = ALPHABET.length

	BASE_URL = 'tinyurl-lwillson.herokuapp.com/'

	def to_tiny_url
		BASE_URL + self.encode_id
	end

	# class method
	# gives you the id for the identifier portion of the tiny link
	def decode_tiny_link_identifier(str)
		i = 0
		str.each_char { |c| i = i * N + ALPHABET.index(c) }
  		i
	end

	# returns the identifying string that is mapped from the id of the link
	# Base N encoding
	def encode_id
  		str = ''
		while self.id > 0
			str << ALPHABET[self.id.modulo(N)]
		    self.id /= N
		end
		str.reverse
	end
end