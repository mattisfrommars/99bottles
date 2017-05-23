# Knows about songs and singing
class Bottles
  def verse(n)
    BottleVerse.new(n).to_s
  end

  def verses(hi, lo)
    hi.downto(lo).map do |i|
      verse i
    end.join("\n")
  end

  def song
    verses 99, 0
  end
end

class BottleVerse
  def initialize(n)
    @n = n
  end

  def to_s
    [
      "#{quantity @n} #{container @n} of beer on the wall, #{quantity @n} #{container @n} of beer.",
      "#{action_to_perform(@n)}, #{quantity ((@n - 1) % 100)} #{ container @n - 1} of beer on the wall.",
      ""
    ].map(&:capitalize).join("\n")
  end

  private

  def to_remove (n)
    if n == 1
      'it'
    else
      'one'
    end
  end

  def container (n)
    if n == 1
      'bottle'
    else
      'bottles'
    end
  end

  def quantity (n)
    if n === 0
      'no more'
    else
      n
    end
  end

  def action_to_perform(n)
    if n == 0
      'Go to the store and buy some more'
    else
      "Take #{to_remove n} down and pass it around"
    end
  end
end