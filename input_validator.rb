class InputValidator
	def initialize(value)
		@value = value
	end

	def valid?
		validate
		@message.nil?
	end

	def message
		@message
	end

	private

		def validate
			if @value.to_s.empty?
				@message = EMPTY_INPUT_MESSAGE
			elsif /^[0-9]{1,2}$/ === @value or @value == '100'
			 	@message = nil
			else
				@message = WRONG_INPUT_MESSAGE
			end				
		end
end