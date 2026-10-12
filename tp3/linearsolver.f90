module linearsolver
  use matutils
  implicit none
contains
  subroutine jacobi(A, b, x, kmax, epsilon, converge, iter)
    type(MatrixSparse), intent(in) :: A
    real(8), intent(in) :: b(:), epsilon
    integer, intent(in) :: kmax
    real(8), intent(out) :: x(:)
    logical, intent(out) :: converge
    integer, intent(out) :: iter
    real(8) :: r(A%n), D(A%n)
    integer :: i, k
    D = 0d0
    do i = 1, A%n
       do k = A%nnz(i)+1, A%nnz(i+1)
          if (A%icol(k) == i) D(i) = A%val(k)
       end do
    end do
    x = 0d0; converge = .false.
    do iter = 1, kmax
       r = b - A*x
       if (sqrt(dot_product(r,r)) < epsilon) then
          converge = .true.; return
       end if
       x = x + r/D
    end do
    iter = kmax
  end subroutine
end module linearsolver