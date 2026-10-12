subroutine bench(n, t)
  use matutils
  use linearsolver
  implicit none
  integer, intent(in) :: n
  real(8), intent(out) :: t
  type(MatrixSparse) :: A
  real(8), allocatable :: b(:), x(:)
  logical :: conv
  integer :: iter
  integer(8) :: c0, c1, rate
  allocate(b(n), x(n)); b = 1d0
  A = tridiag(n, -1d0, 4d0, -1d0)
  call system_clock(c0, rate)
  call jacobi(A, b, x, 10000, 1d-8, conv, iter)
  call system_clock(c1)
  t = real(c1-c0, 8)/real(rate, 8)
end subroutine