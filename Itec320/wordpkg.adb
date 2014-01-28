-- This Ada package body gives the implementation for the word abstract
-- data type.  A word is considered to be any consecutive sequence of 
-- non-white-space character.

with Ada.Text_IO, Ada.Characters.Handling;
use Ada.Text_IO, Ada.Characters.Handling;
package body WordPkg is

	-- Creates a new word corresponding to the given string.
	function New_Word(Item : String) return Word is
		A_Word : word;
	begin
		A_Word.Letters(1..Item'Length) := Item;
		A_Word.Length := Item'Length;
		return A_Word;
	end New_Word;

	-- Indicates the number of characters in a word.
	function Length(Item : Word) return Natural is
	begin
		return Item.Length;
	end Length;

	-- Returns the maxium word size supported by this package.
	function Max_Word_Size return Positive is 
	begin
		return MaxWordSize;
	end Max_Word_Size;

	-- Word comparison functons.  The dictional lexiographic ordering
	-- is used to determine when one word is less than another.
	function "="(X, Y : Word) return Boolean is
	begin
		return X.Length = Y.Length and then 
				X.Letters(1..X.Length) = Y.Letters(1..Y.Length);
	end "=";

	function "<="(X, Y : Word) return Boolean is 
	begin
		For I in 1..Natural'Min (X.Length, Y.Length) loop
			if X.Letters(I) < Y.Letters(I) then 
				return True;
			elsif X.Letters(I) > Y.Letters(I) then 
				return False;
			end if;
		end loop;
		return X.Length <= Y.Length;
	end "<=";

	function "<" (X, Y : Word) return Boolean is
	begin
		return X <= Y and not (X = Y);
	end "<";

	function ">=" (X, Y : Word) return Boolean is 
	begin
		return not (X < Y); 
	end ">=";

	function ">" (X, Y : Word) return Boolean is 
	begin
		return not (X <= Y);
	end ">";

	function charAt(Item : Word; Index : Positive) return Character is
	begin
		return Item.Letters(Index);
	end charAt;

	function lowerCase(Item : Word) return Word is 
		Words : Word;
	begin
		Words.Length := Item.Length;
		Words.Letters := Item.Letters;

		for I in 1..Words.Length loop
			if Words.Letters(I) <= 'Z' and Words.Letters(I) >= 'A' then
				Words.Letters(I) := Character'Val(Character'Pos(Words.Letters(I))
				  + (Character'Pos('a')-Character'Pos('A')));
			end if;
		end loop;
		return Words;
	end lowerCase;

--	function upperCase(Item : Word) return Word is 
--		I : Word;
--	begin
--		I := To_Upper(Item);
--		return I;
--	end upperCase;

	-- I/O routines
	--
	-- Skip over an spaces, tabs, or end of line markers in the input to 
	-- determine whether or not another word is present.  If another word
	-- is present, then return True, otherwise return False.
	function Another_Word(FIle : File_Type) return Boolean is 
		C : Character; 
		End_Line : Boolean;
	begin
		loop 
			exit when End_Of_File(FIle);
			Look_Ahead(File, C, End_Line);
			if End_Line then 
				Skip_Line(File);
			else
				if C /= ' ' and C /= ASCII.HT then 
					return True;
				end if;
				Get(File, C);
			end if;
		end loop;
		return False;
	end Another_Word;

	-- Skip any white-space that may preceed the word in the input.
	-- If the word is too long to fit in the representation being 
	-- used, then raise the WordTooLong exception after the characters 
	-- of the word have been read (though not stored).
	procedure Get(File : File_Type; Item : out Word) is
		C : Character;
		End_Line : Boolean;
		TooLong : Boolean := False;
	begin
		Item.Length := 0;
		if Another_Word(File) then
			loop 
				exit when End_Of_File(File);
				Look_Ahead(File, C, ENd_Line);

				exit when End_Line;
				exit when C = ' ' or else C = ASCII.HT;

				Get(File, C);

				-- Raise an exception if the word won't fit.
				if Item.Length = MaxWordSize then
					TooLong := True;
				end if;

				if not TooLong then 
					Item.Length := Item.Length + 1;
					Item.Letters(Item.Length) := C;
				end if;
			end loop;
			if TooLong then 
				raise WordTooLong;
			end if;
		end if;
	end Get;

	procedure Get(Item : out Word) is
	begin 
		Get(Standard_Input, Item);
	end Get;

	-- Write only those charcater that make uo the word.
	procedure Put(FIle : File_Type; Item : Word) is
	begin
		For I in 1..Length(Item) loop
			Put(File,Item.Letters(I));
		end loop;
	end Put;

	procedure Put(Item : Word) is 
	begin 
		Put(Standard_Output, Item);
	end Put;

end WordPkg;
