program convert_temp_array2
    implicit none
    ! Les variables 
    integer :: n   ! Taille dynamique du tableau 
    real(4), allocatable :: Deg_F(:), Deg_C(:), Deg_k(:)
    integer :: i

    ! Lecture de la taille du tableau avec vérification 
    do
        print *, "Please type in n :"
        read *, n
        if (n > 0) then
            exit 
        else
            print *, "Entrer un entier  :"
        end if
    end do

    ! Allocation des tableaux
    allocate(Deg_F(n), Deg_C(n), Deg_k(n))

    ! Lecture des valeurs en F
    print *, "Please type in ", n, " temp values in F:"
    read *, Deg_F

    ! Conversion en C
    Deg_C = 5.0 / 9.0 * (Deg_F - 32.0)

    ! Conversion en K
    Deg_k = Deg_C + 273.15

    ! Affichage des temp en C et K
    print *, "Temp in C and K: "
    do i = 1, n
        print *, "Temp ", i, ": ", Deg_C(i), " in °C, ", "and", Deg_k(i), " in K"
    end do   

    ! On doit liberer la memoire 
    deallocate(Deg_F, Deg_C, Deg_k)

end program convert_temp_array2

