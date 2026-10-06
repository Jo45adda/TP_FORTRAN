program tableaux
    implicit none
    ! Declaration des tableaux
    integer, dimension(5) :: T1                     
    double precision, dimension(5,8) :: T2          
    double precision, dimension(5,8) :: T3     
    character(len=7), dimension(4) :: T4 
    integer, parameter ::  a = lbound(T3, 1)   
    integer, parameter ::  b = ubound(T3, 2)          
    double precision, dimension(1+a,3+b,2) :: T5  
    
    integer :: i, j,k
  
    ! Initialisation T1
    T1 = (/ 1, 2, 3, 4, 5 /) 

    ! Initialisation T2
    do i = 1, 5
        do j = 1, 8
            T2(i,j) = (i + j)  
        end do
    end do

    ! Initialisation T3
    do i = 1, 5
        do j = 1, 8
            T3(i,j) = i-j
        end do
    end do

   ! Initialisation T4
   T4 = (/ "Mery1", "Mery2", "Mery3", "Mery4" /)

   ! Initialisation T5
   do i = 1, 2
    do j = 1, 11
      do k = 1, 2
        T5(i, j, k) = i + j + k
      end do
    end do
   end do  

  ! Affichage de T1
  print *, "Tableau T1 : "  
  print*, T1

  ! Affichage de T2
  print *, "Tableau T2 : "
  do i = 1, 5
    print *, T2(i, :)  
  end do

  ! Affichage de T3
  print *, "Tableau T3 : "
  do i = 1, 5
    print *, T3(i, :)  
  end do

  ! Affichage de T4
  print *, "Tableau T4 : " 
  print*, T4

  ! Affichage de T5 
  print *, "Tableau T5 :"
  do i = 1, 2
    do j = 1, 11
      !print *, "T5(",i,",", j, ",1) = ", T5(i, j, 1), " T5(",i,",", j, ",2) = ", T5(i, j, 2)
      print *, T5(i, j, :)
    end do
  end do


! Verifications avec des fonctions intrinseques
print *, 'Taille du tableau T1 : ', size(T1)
print *, 'Dimensions du tableau T2 : ', shape(T2)
print *, 'Dimensions du tableau T3 : ', shape(T3)
print *, 'Le nombre des elements de T3  : ', size(T3)
print *, 'Dimensions du tableau T4 : ', shape(T4)
print *, 'Dimensions du tableau T5 : ', shape(T5)
print *, 'Le nombre des elements de T5  : ', size(T5)
print *, 'La borne inf de la premiere dimension est   : ', a 
print *, 'La borne sup de la deuxieme dimension est   : ', b 



end program tableaux