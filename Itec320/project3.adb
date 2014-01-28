with ada.Text_IO, wordpkg;
use ada.Text_IO, wordpkg;

procedure client is
	Words : Word;
	count : Integer;
begin
	while not End_Of_File loop
		Get(Words);
	end loop;
end client;
