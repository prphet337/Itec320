with ada.text_io, ada.float_text_io, ada.integer_text_io;
use ada.text_io, ada.float_text_io, ada.integer_text_io;

procedure scores is

	-- Variables
	name: String(1..12);
	lowcut, highcut, points, degdiff: Float;
	scores: Integer;
	total: Float:= 0.0;
	x: Integer:= 0;
	y: Float:= 0.0;
	low: Float:= 0.0;
	high: Float:= 0.0;
	q: String := "Conditional";

begin
    -- Reading the input and starting to make the
	-- output table.
	get(lowcut);
	get(highcut);
	get(scores);
	put("Low cutoff: ");
	put(lowcut, fore => 2, aft => 2, exp => 0);
	new_line;
	put("High cutoff: ");
	put(highcut, fore => 2, aft => 2, exp => 0);
	new_line;
	put("Number of scores: ");
	put(scores, 2);
	new_line;
	new_line;
	put("Name");set_col(15);
	put("DegDiff");set_col(30);
	put("Low");set_col(45);
	put("High");set_col(60);
	put("Points");set_col(75);
	put("Qualify?");set_col(90);
	new_line;

	while not end_of_file loop
		get(name);
		put(name);set_col(15);
		get(degdiff);
		put(degdiff, fore => 0, aft => 2, exp => 0);set_col(30);
		x := 0;
		y := 0.0;
		while x < scores loop
			get(points);
			if x = 0 then 
				low := points;
				high := points;
			end if;
			if low > points then
				low := points;
			end if;
			if high < points then
				high := points;
			end if;
			y := y + points;
			x := x + 1;
		end loop;
		y := (y -(high + low)) * degdiff;
		put(low, fore => 0, aft => 2, exp => 0);set_col(45);
		put(high, fore => 0, aft => 2, exp => 0);set_col(60);
		put(y, fore => 0, aft => 2, exp => 0);set_col(75);
		if y <= lowcut then
			put("No");set_col(90);
		elsif y >= highcut then
			put("Yes");set_col(90);
		else
			put("Conditional");set_col(90);
		end if;
		new_line;
		end loop;
end scores;
