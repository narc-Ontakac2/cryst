gap> START_TEST( "Cryst: wyckoff.tst" );

gap> SetAssertionLevel(1);

gap> List( [1..17], i -> Length( WyckoffPositions( SpaceGroupIT(2,i) ) ) );
[ 1, 5, 3, 1, 2, 9, 4, 3, 6, 4, 7, 5, 4, 5, 4, 4, 6 ]

gap> List( [1..230], i -> Length( WyckoffPositions( SpaceGroupIT(3,i) ) ) );
[ 1, 9, 5, 1, 3, 3, 1, 2, 1, 15, 6, 10, 7, 5, 6, 21, 5, 3, 1, 3, 12, 11, 11, 
  7, 9, 3, 5, 4, 1, 5, 3, 3, 1, 5, 6, 2, 5, 6, 4, 3, 3, 5, 3, 5, 3, 4, 27, 
  13, 18, 13, 12, 7, 12, 6, 9, 5, 5, 11, 7, 5, 3, 4, 8, 8, 18, 14, 15, 9, 16, 
  8, 15, 11, 6, 11, 4, 1, 5, 1, 3, 3, 8, 7, 12, 12, 7, 7, 9, 6, 16, 9, 4, 3, 
  17, 10, 4, 3, 12, 12, 7, 5, 6, 6, 4, 4, 9, 3, 5, 5, 5, 3, 15, 14, 7, 6, 12, 
  10, 11, 12, 10, 10, 11, 8, 21, 14, 14, 11, 15, 12, 11, 7, 21, 17, 11, 15, 
  10, 16, 9, 11, 16, 16, 11, 9, 4, 1, 1, 2, 7, 6, 12, 7, 3, 3, 3, 3, 6, 5, 4, 
  4, 4, 3, 2, 12, 9, 10, 7, 9, 6, 4, 1, 1, 5, 5, 4, 12, 12, 9, 14, 3, 3, 12, 
  12, 9, 6, 4, 4, 5, 15, 12, 12, 9, 18, 13, 12, 12, 10, 8, 7, 3, 7, 12, 9, 9, 
  7, 9, 5, 7, 11, 16, 11, 12, 10, 9, 9, 12, 10, 9, 8, 10, 8, 6, 14, 9, 15, 
  14, 13, 11, 10, 9, 12, 9 ]

gap> STOP_TEST( "wyckoff.tst", 10000 );