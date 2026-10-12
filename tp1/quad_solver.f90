program quad_solver_opt
    implicit none

    real :: a, b, c, delta
    real :: one_over_2a
    real :: r, r1, r2
    complex :: racine_1, racine_2  

    ! Entrer les coefficients a, b et c
    print *, "Entrez les coefficients a, b et c :"
    read *, a, b, c

    ! Cas particulier :
    if (a == 0.0) then
        if (b == 0.0) then
            if (c == 0.0) then
                print *, "L'équation a une infinité de solutions."
            else
                print *, "Pas de solution."
            end if
        else
            ! Si a = 0 et b ≠ 0, résoudre une équation linéaire
            r1 = -c / b
            print *, "C'est une équation linéaire avec une solution : x =", r1
        end if
        stop
    end if

    ! Pré-calculer les valeurs pour optimiser le programme
    one_over_2a = 1.0 / (2.0 * a)
    delta = b**2 - 4.0 * a * c
    print *, "La valeur de delta est : ", delta

    if (delta > 0.0) then
        r = sqrt(delta)
        r1 = (-b + r) * one_over_2a
        r2 = (-b - r) * one_over_2a
        print *, "L'équation admet deux solutions réelles : ", r1, "et", r2
    else if (delta == 0.0) then
        r1 = -b * one_over_2a
        print *, "L'équation admet une solution réelle unique : ", r1
    else
        ! Racines complexes
        r = sqrt(-delta)
        racine_1 = cmplx(-b * one_over_2a, -r * one_over_2a)
        racine_2 = cmplx(-b * one_over_2a, r * one_over_2a)
        print *, "Pas de solution réelle. Les racines complexes sont : ", racine_1, "et", racine_2
    end if

end program quad_solver_opt
