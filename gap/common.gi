#############################################################################
##
#A  common.gi               CrystGap library                     Bettina Eick
#A                                                              Franz G"ahler
#A                                                              Werner Nickel
##
#Y  Copyright 1990-1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  Common utility routines, most of which deal with integral matrices
##

#############################################################################
##
#F  MutableMatrix( M ) . . . . . . . . . . . . . . . . mutable copy of matrix
##
MutableMatrix := function( M )
    return List( M, ShallowCopy );
end;

#############################################################################
##
#F  AffMatMutableTrans( M ) . . . . . .affine matrix with mutable translation
##
AffMatMutableTrans := function( M )
    local l;
    if not IsMutable( M ) then
        M := ShallowCopy( M );
    fi;
    l := Length( M );
    if not IsMutable( M[l] ) then
        M[l] := ShallowCopy( M[l] );
    fi;
    return M;
end;

#############################################################################
##
#F  IsDiagonalMat . . . . . . . . . . . . . . . . . . is the matrix diagonal?
##
IsDiagonalMat := function( M )
    
    local i, j;
    
    if Length(M) = 0 then return true; fi;
    if Length(M) <> Length(M[1]) then return false; fi;
    for i in [1..Length(M)] do
        for j in [i+1..Length(M[1])] do
            if M[i][j] <> 0 then return false; fi;
            if M[j][i] <> 0 then return false; fi;
        od;
    od;
    return true;
end;

#############################################################################
##
#F  RowEchelonForm  . . . . . . . . . . row echelon form of an integer matrix
##
RowEchelonForm := function( M )
    
    local a, i, j, k, m, n, r, Cleared;
    
    if M = [] then return []; fi;
    
    M := MutableMatrix( M );
    m := Length( M ); n := Length( M[1] );
    
    i := 1; j := 1;
    while i <= m and j <= n do
        k := i; while k <= m and M[k][j] = 0 do k := k+1; od;
        if k <= m then
            r := M[i]; M[i] := M[k]; M[k] := r;
            for k in [k+1..m] do
                a := AbsInt( M[k][j] );
                if a <> 0 and a < AbsInt( M[i][j] ) then
                    r := M[i]; M[i] := M[k]; M[k] := r;
                fi;
            od;
            if M[i][j] < 0 then M[i] := -1 * M[i]; fi;
            Cleared := true;
            for k in [i+1..m] do
                a := QuoInt(M[k][j],M[i][j]);
                if a <> 0 then  M[k] := M[k] - a * M[i]; fi;
                if M[k][j] <> 0 then Cleared := false; fi;
            od;
            if Cleared then i := i+1; j := j+1; fi;
        else 
            j := j+1;
        fi;
    od;
    return M{[1..i-1]};
end;

#############################################################################
##
#F  RowEchelonFormVector  . . . . . . . . . . . .row echelon form with vector 
##
RowEchelonFormVector := function( M, b )
    
    local a, i, j, k, m, n, r, Cleared;
    
    M := MutableMatrix( M );
    m := Length( M );
    if m = 0 then return M; fi;
    n := Length( M[1] );
    
    i := 1; j := 1;
    while i <= m and j <= n do
        k := i; while k <= m and M[k][j] = 0 do k := k+1; od;
        if k <= m then
            r := M[i]; M[i] := M[k]; M[k] := r;
            r := b[i]; b[i] := b[k]; b[k] := r;
            for k in [k+1..m] do
                a := AbsInt( M[k][j] );
                if a <> 0 and a < AbsInt( M[i][j] ) then
                    r := M[i]; M[i] := M[k]; M[k] := r;
                    r := b[i]; b[i] := b[k]; b[k] := r;
                fi;
            od;
            if M[i][j] < 0 then M[i] := -1 * M[i]; b[i] := -1 * b[i]; fi;
            Cleared := true;
            for k in [i+1..m] do
                a := QuoInt(M[k][j],M[i][j]);
                if a <> 0 then
                    M[k] := M[k] - a * M[i];
                    b[k] := b[k] - a * b[i];
                fi;
                if M[k][j] <> 0 then Cleared := false; fi;
            od;
            if Cleared then i := i+1; j := j+1; fi;
        else 
            j := j+1;
        fi;
    od;
    return M{[1..i-1]};
end;

#############################################################################
##
#F  RowEchelonFormT . . . . . . . row echelon form with transformation matrix
##
RowEchelonFormT := function( M, T )
    
    local a, i, j, k, m, n, r, Cleared;
    
    M := MutableMatrix( M );
    m := Length( M ); n := Length( M[1] );
    
    i := 1; j := 1;
    while i <= m and j <= n do
        k := i; while k <= m and M[k][j] = 0 do k := k+1; od;
        if k <= m then
            r := M[i]; M[i] := M[k]; M[k] := r;
            r := T[i]; T[i] := T[k]; T[k] := r;
            for k in [k+1..m] do
                a := AbsInt( M[k][j] );
                if a <> 0 and a < AbsInt( M[i][j] ) then
                    r := M[i]; M[i] := M[k]; M[k] := r;
                    r := T[i]; T[i] := T[k]; T[k] := r;    
                fi;
            od;
            if M[i][j] < 0 then 
                M[i] := -1 * M[i]; 
                T[i] := -1 * T[i]; 
            fi;
            Cleared := true;
            for k in [i+1..m] do
                a := QuoInt(M[k][j],M[i][j]);
                if a <> 0 then 
                    M[k] := M[k] - a * M[i]; 
                    T[k] := T[k] - a * T[i];
                fi;
                if M[k][j] <> 0 then Cleared := false; fi;
            od;
            if Cleared then i := i+1; j := j+1; fi;
        else 
            j := j+1;
        fi;
    od;
    return M{[1..i-1]};
end;

#############################################################################
##
#F  HermiteNormalForm . . . . . . .  Hermite normal form of an integer matrix
##
#HermiteNormalForm := function( mat )
#    local new, tmp, n;
#    if mat = [] then return []; fi;
#    return HermiteNormalFormIntegerMat( mat );
#    new := HermiteNormalFormIntegerMat( mat );
#    tmp := [];
#    for n in new do
#        if 0*n <> n then
#            Add( tmp, n );
#        fi;
#    od;
#    return tmp;
#end;

#############################################################################
##
#F  FractionModOne  . . . . . . . . . . . . . . . . . . a fraction modulo one
##
FractionModOne := function( q )
    q := q - Int(q);
    if q < 0 then q := q+1; fi;
    return q;
end;

#############################################################################
##
#F  VectorModL . . . . . . . . . . . . . . . . .vector modulo a free Z-module
##
VectorModL := function( v, L )

    local l, i, x, j;

    for l in L do
        i := PositionProperty( l, x -> x<>0 );
        x := v[i]/l[i];
        j := Int( x );
        if x < 0 and not IsInt( x ) then j := j-1; fi;
        v := v - j*l;
    od;
    return v;

end;

#############################################################################
##
#F  IntSolutionMat( M, b ) . . integer solution for inhom system of equations
##
IntSolutionMat := function( M, b )

    local Q, den, sol, i, x;

    if M = [] then
        return false;
    fi;

    den := Lcm( List( Flat( M ), x -> DenominatorRat( x ) ) );
    if den <> 1 then
        M := den*M;
        b := den*b;
    fi;

    b := ShallowCopy(b);
    Q := IdentityMat( Length(M) );
    
    M := TransposedMat(M);
    M := RowEchelonFormVector( M,b );
    while not IsDiagonalMat(M) do
        M := TransposedMat(M);
        M := RowEchelonFormT(M,Q);
        if not IsDiagonalMat(M) then
            M := TransposedMat(M);
            M := RowEchelonFormVector(M,b);
        fi;
    od;

    # are there integer solutions?
    sol:=[];
    for i in [1..Length(M)] do
        x := b[i]/M[i][i];
        if IsInt( x ) then
            Add( sol, x );
        else 
            return false;
        fi;
    od;

    # are there solutions at all?
    for i in [Length(M)+1..Length(b)] do
        if b[i]<>0 then
            return false;
        fi;
    od;

    return sol*Q{[1..Length(sol)]};

end;

#############################################################################
##
#F  ReducedLatticeBasis . . . . . . . . . reduce lattice basis to normal form
##
ReducedLatticeBasis := function ( trans )

    local tmp, den, n, zero;

    if trans = [] or Rank( trans ) = 0 then
        return [];
    else
        tmp   := Flat( trans );
        if ForAll( tmp, IsInt ) then
            trans := HermiteNormalFormIntegerMat( trans );
        else
            den := Lcm( List( tmp, DenominatorRat ) );
            trans := HermiteNormalFormIntegerMat( den*trans )/den;
        fi;
    fi;

    tmp  := [];
    zero := 0*trans[1];
    for n in trans do
        if n <> zero then
            Add( tmp, n );
        fi;
    od;
    return tmp;

end;


#############################################################################
##
#F  UnionModule( M1, M2 ) . . . . . . . . . . . . union of two free Z-modules
##
UnionModule := function( M1, M2 )
    return ReducedLatticeBasis( Concatenation( M1, M2 ) );
end;


#############################################################################
##
#F  IntersectionModule( M1, M2 ) . . . . . intersection of two free Z-modules
##
IntersectionModule := function( M1, M2 )

    local M, Q, T;

    if M1 = [] or M2 = [] then
        return [];
    fi;
    M := Concatenation( M1, M2 );
    M := M*Lcm( List( Flat( M ), DenominatorRat ) );
    Q := IdentityMat( Length( M ) );
    M := RowEchelonFormT( M, Q );
    T := Q{[Length(M)+1..Length(Q)]}{[1..Length(M1)]}*M1;
    return ReducedLatticeBasis( T );

end;

