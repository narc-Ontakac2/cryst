#############################################################################
##
#A  wyckoff.gd              CrystGap library                     Bettina Eick
#A                                                              Franz G"ahler
#A                                                              Werner Nickel
##
#Y  Copyright 1990-1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

#############################################################################
##
#R  IsWyckoffPosition . . . . . . . . . . . . . . . . . . . IsWyckoffPosition
##
DeclareRepresentation( "IsWyckoffPosition", 
    IsComponentObjectRep and IsAttributeStoringRep, 
    [ "basis", "translation", "spaceGroup", "class" ] );

#############################################################################
##
#F  WyckoffPositionObject . . . . . . . . . . .make a Wyckoff position object
##
DeclareGlobalFunction( "WyckoffPositionObject" );

#############################################################################
##
#F  WyckoffSpaceGroup . . . . . . . . . . . . .space group of WyckoffPosition
##
DeclareOperation( "WyckoffSpaceGroup", [ IsWyckoffPosition ] );

#############################################################################
##
#F  WyckoffTranslation . . . . . . . . . .translation of representative space
##
DeclareOperation( "WyckoffTranslation", [ IsWyckoffPosition ] );

#############################################################################
##
#F  WyckoffBasis . . . . . . . . . . . . . . . .basis of representative space
##
DeclareOperation( "WyckoffBasis", [ IsWyckoffPosition ] );

#############################################################################
##
#F  ReduceAffineSubspaceLattice . . . . reduce affine subspace modulo lattice
##
DeclareGlobalFunction( "ReduceAffineSubspaceLattice" );

#############################################################################
##
#F  ImageAffineSubspaceLattice . . . .image of affine subspace modulo lattice
##
DeclareGlobalFunction( "ImageAffineSubspaceLattice" );

#############################################################################
##
#F  ImageAffineSubspaceLatticePointwise . . . . . . image of pointwise affine 
#F                                                    subspace modulo lattice
##
DeclareGlobalFunction( "ImageAffineSubspaceLatticePointwise" );

#############################################################################
##
#A  WyckoffStabilizer . . . . . . . . . stabilizer of representative subspace
##
DeclareAttribute( "WyckoffStabilizer", IsWyckoffPosition );

#############################################################################
##
#F  WyckoffOrbit . . . . . . . . . . . . orbit of pointwise subspace lattices
##
DeclareAttribute( "WyckoffOrbit", IsWyckoffPosition );

#############################################################################
##
#A  WyckoffPositions( <S> ) . . . . . . . . . . . . . . . . Wyckoff positions 
##
DeclareAttribute( "WyckoffPositions", IsAffineCrystGroupOnLeftOrRight );

#############################################################################
##
#F  WyckoffPositionsByStabilizer( S, stabs ) . . Wyckoff pos. for given stabs 
##
DeclareGlobalFunction( "WyckoffPositionsByStabilizer" );

