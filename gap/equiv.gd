#############################################################################
##
#A  equiv.gd                CrystGap library                     Bettina Eick
#A                                                              Franz G"ahler
#A                                                              Werner Nickel
##
#Y  Copyright 1990-1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

#############################################################################
##
#O  ConjugatorSpaceGroups( S1, S2 ) . . . . . . . . .returns C with S1^C = S2
##
DeclareOperation( "ConjugatorSpaceGroups",
    [ IsAffineCrystGroupOnLeftOrRight, IsAffineCrystGroupOnLeftOrRight ] );