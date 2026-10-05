program quad_solver_opt
    implicit none
    real :: a, b, c, delta, x1, x2, x0,one_over_2a,r
    complex :: z1, z2

    ! Instruction
    print *, "Insert the coefs of your equation (a, b, c):"
    read *, a, b, c
    one_over_2a = 1.0/(2.0*a)

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
        r = sqrt(delta)
        x1 = (-b+r)*one_over_2a
        x2 = (-b-r)*one_over_2a
        print *, "On a deux solutions reelles :"
        print *, "x1 = ", x1, " et x2 = ", x2

    else if (delta == 0.0) then
        
        x0 = -b *one_over_2a
        print *, "On a une solution double :"
        print *, "x0 = ", x0

    else
        r=sqrt(-delta) 
        z1 = cmplx(-b*one_over_2a,r*one_over_2a)
        z2 = conjg(z1) ! z2 est le conjugué de z1

        print *, "Discriminant negatif : racines complexes conjuguees"
        print *, "z1 = ", z1
        print *, "z2 = ", z2
    end if

end program quad_solver_opt   
