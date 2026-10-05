program quad_solver
    implicit none
    real :: a, b, c, delta, x1, x2, x0
    complex :: z1, z2

    ! Instruction
    print *, "Insert the coefs of your equation (a, b, c):"
    read *, a, b, c

    ! Cas limite : équation du 1er degré
    if (a == 0.0) then
        if (b /= 0.0) then
            print *, "Equation du 1er degre. Solution : x = ", -c / b
        else
            print *, "Equation invalide (a et b sont nuls)."
        end if
        stop
    end if

    delta = b**2 - 4.0 * a * c

    if (delta > 0.0) then
        ! Ajout des parentheses autour de (2.0*a)
        x1 = (-b + sqrt(delta)) / (2.0 * a)
        x2 = (-b - sqrt(delta)) / (2.0 * a)
        print *, "On a deux solutions reelles :"
        print *, "x1 = ", x1, " et x2 = ", x2

    else if (delta == 0.0) then
        
        x0 = -b / (2.0 * a)
        print *, "On a une solution double :"
        print *, "x0 = ", x0

    else
        ! Conversion propre du numerateur en complexe
        z1 = (cmplx(-b, 0.0) + sqrt(cmplx(delta, 0.0))) / (2.0 * a)
        z2 = conjg(z1) ! z2 est le conjugué de z1

        print *, "Discriminant negatif : racines complexes conjuguees"
        print *, "z1 = ", z1
        print *, "z2 = ", z2
    end if

end program quad_solver   
