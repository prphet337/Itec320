-- pals.abd 
-- By Ryan Skipper
--
-- Reads input from a sting into an array then deletes the 
-- non standard characters/spaces then checks to see if the
-- remaining characters are a palindrome.

with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure pals is

	subtype Int_Range is Integer range 1..72;
	type Str_Array is array (Int_Range) of Character;

	Array_1 : Str_Array;
	
	procedure get_file is
		Str1, Str2, Str3, Str4, Str5: String(Int_Range);
	begin
		while not end_of_file loop
			get_line(Str1);
			get_line(Str2);
			get_line(Str3);
			get_line(Str4);
			get_line(Str5);
		end loop;
	end get_file;
begin
	get_file;
	
	Array_1 := Str1;
	

end pals;

