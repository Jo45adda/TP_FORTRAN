program area
    implicit none
    real :: radius
    real :: aire, V
    real, parameter :: pi = 4.0 * atan(1.0)

    ! Entrer le rayon
    print *, "Type in the radius, a negative value will terminate"
    read *, radius

    ! Sortir si le rayon est négatif
    if (radius < 0) then
        print *, "Program terminated."
        stop
    end if

    ! Calculer l'aire 
    aire = pi * radius**2
    print *, "Area of circle with radius ", radius, " is ", aire

    ! Calculer le volume 
    V = (4.0 / 3.0) * pi * radius**3
    print *, "Volume of sphere with radius ", radius, " is ", V

end program area
