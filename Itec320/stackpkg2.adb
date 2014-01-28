-- This is the generic specification for a dynamic stack abstract data type.


   -- Size : Positive;
   -- Size is included so that the array and dynamic implementations will have
   -- the same specification.
   -- Size can be ignored in the dynamic implementation.

PACKAGE Body stackpkg2 IS

   FUNCTION IsEmpty (S : Stack) RETURN Boolean is
   begin
	   return S = null;
   end IsEmpty;

   FUNCTION IsFull (S : Stack) RETURN Boolean is
   begin
	   return false;
   end IsFull;

   PROCEDURE Push (Item : ItemType;S : IN OUT Stack) is
   newNode : Stack;
   begin
       newNode := new StackNode;
	   newNode.ALL.Item := Item;
	   newNode.ALL.Next := S;
	   S := newNode;
   end push;
   
   PROCEDURE Pop (S : IN OUT Stack) is
   begin
       S := S.ALL.Next;
   end Pop;

   FUNCTION Top (S : Stack) RETURN ItemType is
   begin
       return S.ALL.Item;
   end Top;

END stackpkg2;
