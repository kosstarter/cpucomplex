//LIB_GENERAL.KS

FUNCTION FORMATMET {LOCAL ts IS TIME+MISSIONTIME-TIME:SECONDS. RETURN "[T+"+padZ(ts:YEAR-1)+"-"+padZ(ts:DAY-1,3)+" "+padZ(ts:HOUR)+":"+padZ(ts:MINUTE)+":"+padZ(ROUND(ts:SECOND))+"]".}
FUNCTION PADZ {PARAMETER t, l is 2. RETURN (""+t):PADLEFT(l):REPLACE(" ","0").}
FUNCTION FYI {PARAMETER n. SET a1 TO PROCESSOR("gui"). SET a2 TO a1:CONNECTION. a2:SENDMESSAGE(core:tag+";"+n). SET a1 TO PROCESSOR("com"). SET a2 TO a1:CONNECTION. a2:SENDMESSAGE(core:tag+";"+n).}
FUNCTION FIU {PARAMETER n. SET a1 TO PROCESSOR("gui"). SET a2 TO a1:CONNECTION. a2:SENDMESSAGE(core:tag+";"+n).}

set klok to time:seconds.
when time:seconds > klok + 1 then {set klok to time:seconds. FIU("IMA"). return true.}
CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal"). 
CLEARSCREEN.
