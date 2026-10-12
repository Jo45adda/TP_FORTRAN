program verifications
  use matutils
  use linearsolver
  implicit none
  type(MatrixSparse) :: A
  real(8), allocatable :: b(:), x(:)
  real(8) :: a1, a2, a3, a4, eps
  integer :: n, kmax, iter, i
  logical :: conv

  open(10, file='lp.dat', status='old')
  read(10,*) n; read(10,*) a1, a2, a3, a4; read(10,*) kmax, eps
  close(10)

  allocate(b(n), x(n)); b = a4
  A = tridiag(n, a1, a2, a3)

  if (abs(a2) <= abs(a1) + abs(a3)) &
     print *, 'ATTENTION : A n''est pas a diagonale strictement dominante, Jacobi peut diverger'

  print *, 'trace =', trace(A), '  norme_inf =', norme(A)
  call jacobi(A, b, x, kmax, eps, conv, iter)
  if (conv) then
     print *, 'Convergence en', iter, 'iterations'
  else
     print *, 'kmax =', kmax, 'atteint SANS convergence'
  end if
  open(11, file='res.dat'); write(11,'(I6,ES20.10)') (i, x(i), i=1,n); close(11)
end program