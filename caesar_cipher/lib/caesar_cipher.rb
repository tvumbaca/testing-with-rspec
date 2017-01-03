def caesar_cipher(text, shift)
	arr_text = text.split("")
	num_array = []
	num_array = arr_text.map do |letter|
		# checks if its a letter - not a number or punctuation/special character 
		if (65..90).include?(letter.ord) || (97..122).include?(letter.ord) 
			shift_letter = letter.ord + shift
			# checks if letter need to be looped back to beginning of alphabet
			if (letter.ord < 91 && shift_letter > 90) || (letter.ord < 123 && shift_letter > 122) 
				shift_letter = letter.ord - 26 + shift # calculates which letter spot it should be looped back to
				shift_letter.chr # converts the number into the new letter
			else 
			shift_letter.chr
			end
		else
			letter
		end
	end
	num_array.join
end
