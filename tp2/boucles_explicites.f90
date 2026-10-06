program boucles_explicites
    implicit none
    integer :: i, nR
    double precision, allocatable, dimension(:) :: R
    double precision, dimension(-1:9) :: Q
    double precision, dimension(1:11) :: T
    double precision, dimension(3,11) :: V
    double precision, dimension(4, 11) :: U  
    double precision :: temps_debut, temps_fin, temp

    ! Demander à l'utilisateur d'entrer la taille de nR
    print *, "Entrez la taille de nR :"
    read *, nR
    if (nR < 2) then
        print *, "Erreur : nR doit être supérieur ou égal à 2. Programme terminé."
        stop
    end if

    ! Allouer le tableau R dynamiquement en fonction de nR
    allocate(R(nR))

    ! Calcul du tableau R
    call cpu_time(temps_debut)
    R = (/ (3.*i+1,i=1,size(R)-2),-1.,-2./)
    call cpu_time(temps_fin)
    temp = temps_fin - temps_debut
    print *, "Temps de calcul pour R :", temp

    ! Initialisation de T
    do i = 1, 11
        !T(i) = 4 * atan(1.d0) / 2
        T(i) = i
    end do

    ! Calcul du tableau Q
    call cpu_time(temps_debut)
    Q(-1:9) = 2.*sin(T(1:11)) + R
    call cpu_time(temps_fin)
    temp = temps_fin - temps_debut
    print *, "Temps de calcul pour Q :", temp

    ! Initialisation de V pour le calcul de U
    do i = 1, 11
        V(3, i) = i * 0.5  
    end do

    ! Calcul de U(4,:)
    call cpu_time(temps_debut)
    do i = 1, 11
        U(4, i) = V(3, i) / Q(i-2) + 5.0
    end do
    call cpu_time(temps_fin)
    temp = temps_fin - temps_debut
    print *, "Temps de calcul pour U :", temp

    ! Affichage des résultats
    print *, "Tableau R :", R
    print *, "Tableau Q :", Q
    print *, "Tableau U(4,:) :", U(4, :)

    ! Libérer la mémoire
    deallocate(R)
    
end program boucles_explicites
