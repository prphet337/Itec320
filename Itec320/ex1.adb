with ada.text_io,ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure swapNumbers is
	procedure swap (num1, num2 :in  out Integer) is
		temp: Integer;
	begin
		temp := num1; 
		num1 := num2; 
		num2 := temp;

	end swap;

	num1, num2: Integer;

begin

	num1 := 4; 
	num2 := 5;
	swap(num1, num2);
	put("Number 1: " & num1'Img);
	new_line;
	put("Number 2: " & num2'Img);

end swapNumbers;
