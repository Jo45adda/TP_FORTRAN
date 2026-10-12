program stockage
    implicit none
    integer :: n1, n2, n3, i, j, k
    double precision, allocatable :: T1(:,:,:), T2(:,:,:)
    double precision :: t_initial, t_final, t

    ! Définir les dimensions des tableaux
    n1 = 500
    n2 = 500
    n3 = 500
    ! Allouer les tableaux T1 et T2
    allocate(T1(n1, n2, n3))
    allocate(T2(n1, n2, n3))

    ! Initialiser T1 et T2
    T1 = 3.0
    T2 = 4.0

    ! Mesurer le temps de la méthode 1
    call cpu_time(t_initial)
    do i = 1, n1
        do j = 1, n2
            do k = 1, n3
                T1(i, j, k) = 2.0 + T2(i, j, k)
            end do
        end do
    end do
    call cpu_time(t_final)
    t= t_final - t_initial
    print *, "Temps de calcul pour M_1 : ", t, " secondes"

    ! Reinitialiser T1 pour la methode 2
    T1 = 3.0

    ! Mesurer le temps de la methode 2
    call cpu_time(t_initial)
    T1 = 2.0 + T2
    call cpu_time(t_final)
    t = t_final - t_initial
    print *, "Temps de calcul pour M_2 : ", t, " secondes"

    ! Libérer la mémoire
    deallocate(T1, T2)
end program stockage
