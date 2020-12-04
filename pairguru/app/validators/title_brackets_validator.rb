class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    symbols = {"("=>")","{"=>"}","["=>"]"}
    brackets = []
    record.title.each_char do |s|
      brackets.push(s) if symbols.keys.include?(s)
      record.errors.add(:title, "has invalid title") if symbols.key(s) && symbols.key(s) != brackets.pop
    end
    record.errors.add(:title, "has invalid title") unless brackets.empty?
  end
end
