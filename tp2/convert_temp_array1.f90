program convert_temp_array1
    implicit none
    ! Les variables 
    integer, parameter :: n = 5   ! Taille explicite du tableau 
    real(4), dimension(n) :: Deg_F, Deg_C, Deg_k
    integer :: i

    ! Lecture des valeurs en F
    print *, "Please type in ", n, " temp values in F:"
    read *, Deg_F

    ! Conversion en C
    Deg_C = 5.0 / 9.0 * (Deg_F - 32.0)
    ! Conversion en K
    Deg_k = Deg_C + 273.15

    ! Affichage des temp en C et K
    print *, "Temp in C and K:"
    do i = 1, n
        print *, "temp ", i, ": ", Deg_C(i),"in °C, ","and", Deg_k(i), " in K"
    end do   

end program convert_temp_array1
