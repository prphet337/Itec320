with ada.integer_text_io, ada.text_io, queuepkg2, stackpkg2;
use ada.integer_text_io, ada.text_io;

procedure contest is
	type contestant is record
		Name: String(1..20);
		SKill: Integer; 
		Arrival: Integer;
		Wins: Integer;
		Losses: Integer;
	end record;

	package Loss is new queuepkg2 (10, contestant);
	package Standing is new stackpkg2 (10, contestant);

	LossQueue : Loss.queue;
	StandingStack : Standing.stack;
	SingleLossQueue : Loss.queue;

	player : contestant;
	temp : String(1..20);
	tempMarker : Integer;
	playerCount : Integer;
	player1 : contestant;
	player2 : contestant;
	singleCount : Integer;

begin

	singlecount := 0;
	playerCount := 0;

	while not end_of_file loop
		get(player.Name);
		get(player.SKill);
		get_line(temp, tempMarker);
		player.Wins := 0;
		player.Losses := 0;
		player.Arrival := playerCount + 1;
		Loss.enqueue(player, LossQueue);
		playerCount := playerCount + 1;
	end loop;

	if playerCount = 0 or playerCount = 1 then
		put("No Contest");

	else
		while playerCount > 1 loop
			player1 := Loss.front(LossQueue);
			Loss.dequeue(LossQueue);
			player2 := Loss.front(LossQueue);
			Loss.dequeue(LossQueue);

			if player1.Skill > player2.Skill then
				player1.Wins := player1.Wins + 1;
				player2.Losses := player2.Losses + 1;
				Loss.enqueue(player1, LossQueue);
				Loss.enqueue(player2, SingleLossQueue);

			else 
				player2.Wins := player2.Wins + 1;
				player1.Losses := player1.Losses + 1;
				Loss.enqueue(player2, LossQueue);
				Loss.enqueue(player1, SingleLossQueue);
			end if;

			playerCount := playerCount + 1;
			singleCount := singleCount + 1;
		end loop;

		while singleCount > 1 loop
			player1 := Loss.front(SingleLossQueue);
			Loss.dequeue(SingleLossQueue);
			player2 := Loss.front(SingleLossQueue);
			Loss.dequeue(SingleLossQueue);

			if player1.Skill > player2.Skill then
				player1.Wins := player1.Wins + 1;
				player2.Losses := player2.Losses + 1;
				Loss.enqueue(player1, SingleLossQueue);
				Standing.Push(player2, StandingStack);
			else
				player2.Wins := player2.Wins + 1;
				player1.Losses := player1.Losses + 1;
				Loss.enqueue(player2, SingleLossQueue);
				Standing.Push(player1, StandingStack);
			end if;
			singleCount := singleCount - 1;
		end loop;

		player1 := Loss.front(LossQueue);
		Loss.dequeue(LossQueue);
		player2 := Loss.front(SingleLossQueue);
		Loss.dequeue(SingleLossQueue);
		player1.Wins := player1.Wins + 1;
		Standing.push(player2, StandingStack);
		Standing.Push(player1, StandingStack);
	end if;

	if Standing.isEmpty(StandingStack) = false then
		put_line("Name:                   Arrival:     Skill:     Wins:     Losses:     ");
	end if;

	while Standing.isEmpty(StandingStack) = false loop
		player1 := Standing.Top(StandingStack);
		Standing.Pop(StandingStack);
		put(player1.Name);
		put(player1.Arrival);
		put(player1.Skill);
		put(player1.Wins);
		put(player1.Losses);
		put_line(" ");
	end loop;

end contest;
