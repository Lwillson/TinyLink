class Link < ActiveRecord::Base
	ALPHABET = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).join
	N = ALPHABET.length

	BASE_URL = 'tinyurl-lwillson.herokuapp.com/'

	validates :url, presence: true
	before_save :add_url_protocol

	def to_tiny_url
		BASE_URL + self.encode_id
	end

	def self.link_for_str(str)
		Link.find(self.decode(str))
	end

	# gives you the id for the identifier portion of the tiny link
	def self.decode(str)
		id = 0
		str.each_char { |c| id = id * N + ALPHABET.index(c) }
  		id
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

	def add_url_protocol
 		unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
    		self.url = "http://#{self.url}"
  		end
	end
end