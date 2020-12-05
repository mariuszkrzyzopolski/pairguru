class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    symbols = {"("=>")","{"=>"}","["=>"]"}
    brackets = []
    record.title.each_char.with_index do |s, index|
      if symbols.keys.include?(s)
        record.errors.add(:title, "empty bracket") if symbols.values.include?(record.title[index+1])
        brackets.push(s)
      end
      record.errors.add(:title, "has invalid title") if symbols.key(s) && symbols.key(s) != brackets.pop
    end
    record.errors.add(:title, "has invalid title") unless brackets.empty?
  end
end
