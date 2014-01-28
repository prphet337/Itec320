-- This is the generic specification for a dynamic queue abstrace data type

	-- Size : Positive; 
	-- Size is included so that the array and dynamic implementations
	-- 		have the same specification
	-- Size can be ignored in the dynamic implementation
	
	type ItemType is private;

package body QueuePkg2 is
	type Queue is limited private;

	Queue_Empty, Queue_Full : exception;

	function isEmpty(Q : Queue) return Boolean is
	begin
		return Q. Front = NULL;
	end isEmpty;

	function isFull(Q : Queue) return Boolean is
	begin
		return False;
	end isFull;

	function front(Q : Queue) return ItemType is 
	begin
		return Q.front.Data; -- Q.front.all.Data;
	end front;

	procedure enqueue(Item : ItemType; Q : in out Queue) is 
	temp : QueueNodePointer;
	begin
		temp := new QueueNode;
		temp.all.Data := Item;
		temp.Next := Q.Back;
		Q.Back := temp;

		if isEmpty(Q) then
			Q.front := temp; -- or Q.front := Q.back;
		end if;
	end enqueue;

	procedure dequeue(Q : in out Queue) is
	current : QueueNodePointer;
	begin
		if isEmpty(Q) then
			raise Queue_Empty;
		end if;
		
		if Q.front = Q.back then
			Q.front := NULL;
			Q.back := NULL;
		else
			current := Q.back;
			while current.Next /= Q.front loop
				current := current.Next;
			end loop;
			Q.front := current;
			current.Next := NULL;
		end if;
	end dequeue;

end QueuePkg2;
