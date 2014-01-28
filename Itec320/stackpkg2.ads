-- This is the generic specification for a dynamic stack abstract data type.

GENERIC
   Size : Positive;
   -- Size is included so that the array and dynamic implementations will have
   -- the same specification.
   -- Size can be ignored in the dynamic implementation.
   TYPE ItemType IS PRIVATE;

PACKAGE StackPkg2 IS

   TYPE Stack IS LIMITED PRIVATE;

   Stack_Empty, Stack_Full: EXCEPTION;

   FUNCTION IsEmpty (
         S : Stack)
     RETURN Boolean;
   FUNCTION IsFull (
         S : Stack)
     RETURN Boolean;

   PROCEDURE Push (
         Item :        ItemType;
         S    : IN OUT Stack);
   PROCEDURE Pop (
         S : IN OUT Stack);

   FUNCTION Top (
         S : Stack)
     RETURN ItemType;

PRIVATE
   TYPE StackNode;

   TYPE Stack IS ACCESS StackNode;

   TYPE StackNode IS
      RECORD
         Item : ItemType;
         Next : Stack;
      END RECORD;

END StackPkg2;