program magic
    implicit none
    integer :: n

    print *, "Entrez un entier strictement positif:"
    read *, n

    ! Verification
    if (n <= 0) then
        print *, "Le nombre doit être strictement positif."
        stop
    end if


    print *, "Séquence magique pour", n, ":"
    do while (n /= 1)
        print *, n
        if (mod(n, 2) == 0) then
            n = n / 2     ! Si n est pair, diviser par 2
        else
            n = 3 * n + 1 ! Si n est impair, multiplier par 3 et ajouter 1
        end if
    end do

    ! Afficher 1, qui est la fin de la séquence
    print *, 1
end program magic