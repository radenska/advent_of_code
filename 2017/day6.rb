banks = [14, 0, 15, 12, 11, 11, 3, 5, 1, 6, 8, 4, 9, 1, 8, 4]
# banks = [0, 2, 7, 0]
def do_it(banks)
  current_banks = banks
  prior_banks = []
  repeated = false
  acc = 0
  while !repeated do
    acc += 1
    highest_bank = current_banks.max
    highest_bank_index = current_banks.index(highest_bank)
    give_away = highest_bank
    current_banks[highest_bank_index] = 0
    while give_away > 0
      if highest_bank_index == current_banks.length - 1
        current_banks.each_with_index do |bank, index|
          if give_away > 0
            current_banks[index] += 1
            give_away = give_away - 1
          end
        end
      else
        ((highest_bank_index + 1)...current_banks.length).each do |index|
          if give_away > 0
            current_banks[index] += 1
            give_away = give_away - 1
          end
        end
        (0..highest_bank_index).each do |index|
          if give_away > 0
            current_banks[index] += 1
            give_away = give_away - 1
          end
        end
      end
    end
    if !prior_banks.include?(current_banks.to_s)
      prior_banks << current_banks.to_s
    else
      repeated = true
    end
  end
  p acc
  do_it(current_banks)
end

do_it(banks)
