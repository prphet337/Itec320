with ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO, wordpkg;
use ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO, wordpkg;

procedure client is

	Words, article1, article2, article3 : Word;
	num_Words, length_Words, count, article_Counter : Integer;

begin
	article1 := New_Word("the");
	article2 := New_Word("a");
	article3 := New_Word("an");
	article_Counter := 0;
	num_Words := 0;
	length_Words := 0;
	count := 0;

	while not End_Of_File loop
		get(Words);

		if lowerCase(Words) = article1 or lowerCase(Words) = article2 
		  or lowerCase(Words) = article3 then
			article_Counter := article_Counter + 1;
		end if;

		if charAt(Words, 1) <= 'Z' and charAt(Words, 1) >= 'A' then
			count := count + 1;
		end if;
		
		length_Words := length_Words + Length(Words);
		num_Words := num_Words + 1;
	
	end loop;

	put("Words in text: ");
	put(num_Words, 0);
	new_line;

	put("Average word length: ");
	put(Float(length_Words)/Float(num_Words), 0, 2, 0);
	new_line;

	put("Number of words capitalized: ");
	put(count, 0);
	new_line;

	put("Number of articles: ");
	put(article_Counter, 0);

end client;
