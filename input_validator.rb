class InputValidator
  attr_reader :message

  def initialize(value)
    @value = value
  end

  def valid?
    validate
    @message.nil?
  end

  private

  def validate
    @message =
      if @value.to_s.empty?
        EMPTY_INPUT_MESSAGE
      elsif /^[0-9]{1,2}$/ === @value or @value == '100'
        nil
      else
        WRONG_INPUT_MESSAGE
      end
  end
end
