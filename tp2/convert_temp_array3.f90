program convert_temp_array3
    implicit none

    integer :: n, i
    real(4), allocatable :: Deg_F(:), Deg_C(:), Deg_k(:)
    character(len=64) :: arg

    ! le nbr des arguments
    n = command_argument_count()

    ! On verifie si c'est les arguments sont bien saisis avec une boucles if 
    if (n == 0) then
        print *, "Please type in the temps."
        stop
    end if

    ! Allouer les tableaux 
    allocate(Deg_F(n), Deg_C(n), Deg_k(n))

    ! Lire les arguments et les convertir en reels
    do i = 1, n
        call get_command_argument(i, arg)
        read(arg, *) Deg_F(i)
    end do

    ! Conversion en C
    Deg_C = 5.0 / 9.0 * (Deg_F - 32.0)
    ! Conversion en K 
    Deg_k = Deg_C + 273.15

    ! Affichage 
    print *, "Temperatures in Celsius and Kelvin:"
    do i = 1, n
        print *, "Temp ", i, ": ", Deg_C(i), " in °C, and", Deg_k(i), " in K."
    end do   

    ! Liberation de la memoire
    deallocate(Deg_F, Deg_C, Deg_k)

end program convert_temp_array3
