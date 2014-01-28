with ada.text_io;
use ada.text_io;

procedure Frequency is 
	subtype Printable is Character range ' '..'-';
	Counts : array(Printable) of Natural := (Printable => 0);

	Char : Character;

begin
	while not End_Of_File loop
		while not End_Of_Line loop
			get(Item => Char);
			if Char in Printable then
				Counts(Char) := Counts(Char) + 1;
			end if;
		end loop;
		Skip_Line;
	end loop;

	for I in Counts'Range loop
		if Counts(I) > 0 then 
			put(I & ":  ");
			for J in 1..Counts(I) loop
				put('*');
			end loop;
			New_Line;
		end if;
	end loop;

end Frequency;
