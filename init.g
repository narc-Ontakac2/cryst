#############################################################################
##
#A  init.g                  CrystGap library                     Bettina Eick
#A                                                              Franz G"ahler
#A                                                              Werner Nickel
##
#Y  Copyright 1990-1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##              CrystGap - the crystallographic groups package
##  
##                            GAP 4 Version
##

DeclareAutoPackage( "cryst", "0.9.1", ReturnTrue );
DeclarePackageAutoDocumentation( "cryst", "doc" );

#############################################################################
##
#R  read the declaration files
##
ReadPkg( "cryst/gap/cryst.gd" );     # declarations for AffineCrystGroups
ReadPkg( "cryst/gap/hom.gd" );       # declarations for homomorphism
ReadPkg( "cryst/gap/wyckoff.gd" );   # declarations for Wyckoff position
ReadPkg( "cryst/gap/zass.gd" );      # declarations for Zassenhaus algorithm
ReadPkg( "cryst/gap/max.gd" );       # declarations for maximal subgroups
ReadPkg( "cryst/gap/color.gd" );     # declarations for color groups
ReadPkg( "cryst/gap/equiv.gd" );     # isomorphism test for space groups
ReadPkg( "cryst/grp/spacegrp.gd" );  # the IT space group catalogue

#############################################################################
##
#R  try to read the CARAT package; don't complain if it is not available
##
OldWarningLevel := InfoLevel( InfoWarning );
SetInfoLevel( InfoWarning, 0 );
RequirePackage( "carat" );
SetInfoLevel( InfoWarning, OldWarningLevel );
Unbind( OldWarningLevel );

