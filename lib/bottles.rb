# Knows about songs and singing
class Bottles
  TOTAL_VERSES = 99

  def verse(n)
    BottleVerse.new(n, TOTAL_VERSES).to_s
  end

  def verses(hi, lo)
    hi.downto(lo).map do |i|
      verse i
    end.join("\n")
  end

  def song
    verses TOTAL_VERSES, 0
  end
end

class BottleVerse
  def initialize(verse_number, total_verses)
    @verse_number = verse_number
    @total_verses = total_verses
  end

  def to_s
    [
      "#{quantity @verse_number} #{container @verse_number} of beer on the wall, #{quantity @verse_number} #{container @verse_number} of beer.",
      "#{action_to_perform(@verse_number)}, #{quantity (n_after_action)} #{container n_after_action} of beer on the wall.",
      ""
    ].map(&:capitalize).join("\n")
  end

  def n_after_action
    (@verse_number - 1) % (@total_verses + 1)
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