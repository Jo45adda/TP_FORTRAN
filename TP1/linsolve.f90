program linsolve
    implicit none
    ! Déclaration
    real :: a, b, c, d, e, f, x, y, det

    print*, "Entrez les coefficients a, b, c, d, e, f :"
    read*, a, b, c, d, e, f

    ! Calcul du déterminant
    det = a * d - b * c

    if (det == 0.0) then
        print*, "Erreur : Le système n'a pas de solution unique (déterminant nul)."
    else
        x = (e * d - b * f) / det
        y = (a * f - e * c) / det
        print*, "x = ", x, " y = ", y
    end if

end program linsolve