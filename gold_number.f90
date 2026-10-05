program gold_number
        implicit none
        ! Déclaration des variables
  double precision :: u_n_1, u_n, a, b, s, eps
  double precision, parameter :: nbr_or = (1.d0+sqrt(5.d0))/2.d0

  ! Initialisation
  u_n_1 = 1.d0
  u_n = 1.d0
  eps = 1.e-12

  do
    b = u_n/u_n_1
    s = u_n + u_n_1
    u_n_1 = u_n
    u_n = s
    a = u_n/u_n_1
    ! Condition de convergence
    if (abs((a - b)/b) < eps) exit
  end do

  print *, "La suite de Fibonacci converge vers : ", a
  print *, "Nombre d'or théorique est  : ", nbr_or
end program gold_number
