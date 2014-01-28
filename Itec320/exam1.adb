with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure exam1 is
	type array1 is array(1..100) of Integer;
	--Int_Array: array1; 
	--Int_Array2: array1;
	s : array1;
	t : array1;

	procedure fillSquares(Int_Array : out array1) is
	begin
		for i in 1..100 loop
 			Int_array(i) := i*i;
		end loop;
	end fillSquares;

	procedure sumSquares
	    (Int_Array : in out array1;
       	     Int_Array2 : out array1)
	is 
		count1: Integer := 1;
		count2: Integer := 0;

	begin
		for i in 1..100 loop
			Int_Array2(i) := Int_Array(count1) + Int_Array(count2);
			count1 := count1 + 1;
			count2 := count2 + 2;
		end loop;
		s := Int_Array;
	end sumSquares;

	procedure putSums(Int_Array2 : in out array1) is 
	begin
		for i in 1..100 loop
			put(Int_Array2(i));
			new_line;
		end loop;
		t := Int_Array2;
	end putSums;

begin 
	fillSquares(s);
	sumSquares(s, t);
	putSums(t);
end exam1;	
