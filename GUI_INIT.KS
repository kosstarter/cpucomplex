//GUI_INIT.KS
//
//     FYI is a function in LIB_GENERAL.KS
//
FUNCTION HAS_FILE {PARAMETER n. PARAMETER v. SWITCH TO v. LIST FILES IN f. FOR file IN f {IF file:NAME = n {SWITCH TO 1. RETURN TRUE.}}SWITCH TO 1. RETURN FALSE.}

copypath("0:/libraries/Lib_general.ks",""). 
copypath("0:/boot/Safemode.ks",""). 
run "Lib_general.ks". 
set terminal:width to 40. 
set terminal:height to 12. 
FYI(" ").
FYI("--------   S T A R T   O F   M I S S I O N    L O G   --------").
FYI(" ").
FYI("Guidance is internal.").
WAIT 0.1.
FYI("Deactivating other processors.").
processor("NAV"):deactivate.
processor("RES"):deactivate.
processor("TLM"):deactivate.
processor("COM"):deactivate.
FYI("Copying general files to other processors.").
copypath("Lib_general.ks","TLM:/Lib_general.ks").
copypath("Lib_general.ks","NAV:/Lib_general.ks").
copypath("Lib_general.ks","COM:/Lib_general.ks").
copypath("Lib_general.ks","RES:/Lib_general.ks").
WAIT 0.2.
FYI("Initializing processor TLM").
copypath("0:/boot/TLM.ks","TLM:/TLM.ks").
set processor("TLM"):bootfilename to "TLM.ks".
processor("TLM"):activate.
wait 0.3.
FYI("Initializing processor COM").
copypath("0:/boot/COM.ks","COM:/COM.ks").
set processor("COM"):bootfilename to "COM.ks".
processor("COM"):activate.
wait 0.3.
FYI("Initializing processor NAV").
copypath("0:/boot/NAV.ks","NAV:/NAV.ks").
copypath("0:/libraries/Lib_NAV.ks","NAV:/Lib_NAV.ks").
set processor("NAV"):bootfilename to "NAV.ks".
processor("NAV"):activate.
wait 0.3.
FYI("Initializing processor RES").
copypath("0:/boot/RES.ks","RES:/RES.ks").
set processor("RES"):bootfilename to "RES.ks".
processor("RES"):activate.
wait 0.3.
FYI("Initializing self").
copypath("0:/boot/GUI.ks","").
set processor("GUI"):bootfilename to "GUI.ks".
wait 0.3.
FYI("Rebooting").
wait 2.
Reboot.
