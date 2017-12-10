require_relative 'secret_number.rb'

class Game
  LANGUAGES = %w[eng ukr ru].freeze

  MESSAGES = {
    eng: ['BINGO!', 'Too HIGH', 'Too LOW', 'Way too LOW', 'Way too HIGH'],
    ukr: ['В яблучко!', 'Забагато', 'Замало', 'Занадто мало', 'Занадто багато'],
    ru: ['В яблочко!', 'Много', 'Мало', 'Слишком мало', 'Слишком много']
  }.freeze

  START_MESSAGE = {
    eng: '<br><br>New Secret Number has been generated<br>You have got new 5 attempts',
    ukr: '<br><br>Було згенеровано НОВЕ СЕКРЕТНЕ ЧИСЛО<br>У вас знову є 5 спроб',
    ru: '<br><br>Cгeнерировано НОВОЕ СЕКРЕТНОЕ ЧИСЛО<br>У Вас снова есть 5 попыток'
  }.freeze

  attr_accessor :lang
  attr_reader :message

  def initialize
    @secret_number = SecretNumber.new
    @guess = '0'
    @message = ''
    @counter = 5
    @lang = LANGUAGES[0]
  end

  def message_case
    @secret_number.check @guess
  end

  def update_lang(lang)
    @lang = lang if lang
  end

  def start(guess)
    @guess = guess
    @message = MESSAGES[@lang.to_sym][message_case]
    @counter -= 1
    reset if over?
  end

  def attempt_number
    6 - @counter
  end

  def secret
    @secret_number.secret
  end

  private

  def over?
    @counter.zero? || @secret_number.equal?(@guess)
  end

  def reset
    @secret_number = SecretNumber.new
    @guess = 0
    @message += START_MESSAGE[@lang.to_sym]
    @counter = 5
  end
end
