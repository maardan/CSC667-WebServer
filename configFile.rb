class ConfigFile
  	attr_reader :line

	def initialize(new_config)

	    @config_array = new_config
	end

	def process_line()

		@config_hash = {}

		@config_array.each do |key_value_pair|
			key , value = key_value_pair.split(" ")
			@config_hash[key.to_sym] = value
		end

		@config_hash
	end

end