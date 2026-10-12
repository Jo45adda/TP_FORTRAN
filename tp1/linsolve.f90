program linsolve
    implicit none
    ! Déclaration des variables
    real :: a, b, c, d, e, f
    real :: det, x, y

    ! Lecture des coefficients
    print *, "Entrez les coefficients a, b, c, d, e, f:"
    read *, a, b, c, d, e, f

    ! Calcul du déterminant de la matrice A
    det = a * d - b * c

    ! Vérification si le déterminant est non nul
    if (det == 0.0) then
        print *, "Le système n'a pas de solution unique."
    else
        ! Calcul de l'inverse de la matrice et résolution du système
        x = (e * d - b * f) / det
        y = (a * f - e * c) / det

        ! Affichage de la solution
        print *, "La solution est : x = ", x, ", y = ", y
    end if
end program linsolve
