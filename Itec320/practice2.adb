with ada.text_io, ada.float_text_io; use ada.text_io, ada.float_text_io;

procedure practice2 is

	name: String(1..11);
	total: Float;

begin

	for k in 1..3 loop
		-- Reading Input
		get(name);
		put(name);
		get(total);

		if total > 89.0 then put ("A");
	elsif total > 79.0 then put ("B");
else put ("C");
end if;

put("Name        ");
put("Grade");
new_line;

end loop;

end practice2;
