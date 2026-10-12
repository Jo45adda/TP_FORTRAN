module matutils
    implicit none
    ! Matrices crees sous forme sparse (format CSR)
    type MatrixSparse
        integer :: n=0 ! les matices sont initialisees de talle 0
        real(8), allocatable :: val(:)
        integer, allocatable :: nnz(:), icol(:)
    end type MatrixSparse

    ! Surcharges de l'operateur * pour les matrices sparse
    interface operator(*) 
        module procedure matvec, matmat 
    end interface operator(*)   
contains
    !creation d'une matrice tridiagonale 
    function tridiag(n,a1,a2,a3) result(A)
        integer, intent(in) :: n ! taille de la matrice (entree, non modifiee)
        real(8), intent(in) :: a1,a2,a3 ! valeurs constantes des 3 diagonales (entrees)
        type(MatrixSparse) :: A
        integer :: i,k

        A%n = n ! Taille de la matrice A
        allocate(A%val(3*n-2))
        allocate(A%nnz(n+1))
        allocate(A%icol(3*n-2))

        k = 0
        A%nnz(1) = 0
        do i = 1,n
            if (i > 1) then
                k = k + 1
                A%val(k) = a1
                A%icol(k) = i - 1
            end if
            k = k + 1
            A%val(k) = a2
            A%icol(k) = i
            if (i < n) then
                k = k + 1
                A%val(k) = a3
                A%icol(k) = i + 1
            end if
            A%nnz(i+1) = k
        end do

    end function tridiag
    ! Trace d'une matrice sparse
    function trace(A) result(tr)
        type(MatrixSparse), intent(in) :: A
        real(8) :: tr
        integer :: i,j

        tr = 0.0d0
        do i = 1,A%n
            do j = A%nnz(i)+1,A%nnz(i+1)
                if (A%icol(j) == i) then
                    tr = tr + A%val(j)
                end if
            end do
        end do

    end function trace
    !Norme infinie d'une matrice sparse
    function norme(A) result(nrm)
        type(MatrixSparse), intent(in) :: A
        real(8) :: nrm
        integer :: i,j
        real(8) :: sum

        nrm = 0.0d0
        do i = 1,A%n
            sum = 0.0d0
            do j = A%nnz(i)+1,A%nnz(i+1)
                sum = sum + abs(A%val(j))
            end do
            if (sum > nrm) then
                nrm = sum
            end if
        end do

    end function norme
    ! produit matrice-vecteur pour une matrice sparse
    function matvec(A,x) result(y)
        type(MatrixSparse), intent(in) :: A
        real(8), intent(in) :: x(:)
        real(8) :: y(A%n)
        integer :: i,j

        y = 0.0d0
        do i = 1,A%n
            do j = A%nnz(i)+1,A%nnz(i+1)
                y(i) = y(i) + A%val(j)*x(A%icol(j))
            end do
        end do

    end function matvec
        ! produit matrice-matrice pour une matrice sparse : C = A*B
    function matmat(A,B) result(C)
        type(MatrixSparse), intent(in) :: A,B
        type(MatrixSparse) :: C
        integer :: i,j,k,l
        integer :: nnzC, maxnnzC, ncols
        integer, allocatable :: rowC(:), colC(:), cols(:)
        real(8), allocatable :: valC(:), w(:)
        logical, allocatable :: used(:)

        ! Majorant du nombre de non-nuls de C
        maxnnzC = 0
        do i = 1,A%n
            do j = A%nnz(i)+1,A%nnz(i+1)
                k = A%icol(j)                          ! colonne j de A = ligne k de B
                maxnnzC = maxnnzC + B%nnz(k+1) - B%nnz(k)
            end do
        end do

        allocate(rowC(A%n+1), colC(maxnnzC), valC(maxnnzC))
        allocate(cols(B%n), w(B%n), used(B%n))
        w = 0.0d0
        used = .false.
        rowC(1) = 0
        nnzC = 0

        do i = 1,A%n
            ncols = 0                                  ! colonnes distinctes de la ligne i
            do j = A%nnz(i)+1,A%nnz(i+1)
                k = A%icol(j)
                do l = B%nnz(k)+1,B%nnz(k+1)
                    if (.not. used(B%icol(l))) then    ! premiere rencontre de cette colonne
                        used(B%icol(l)) = .true.
                        ncols = ncols + 1
                        cols(ncols) = B%icol(l)
                    end if
                    w(B%icol(l)) = w(B%icol(l)) + A%val(j)*B%val(l)
                end do
            end do
            do l = 1,ncols                             ! recopie dans C et remise a zero
                nnzC = nnzC + 1
                colC(nnzC) = cols(l)
                valC(nnzC) = w(cols(l))
                w(cols(l)) = 0.0d0
                used(cols(l)) = .false.
            end do
            rowC(i+1) = nnzC
        end do

        ! Construction de C avec les tailles exactes
        C%n = A%n
        call move_alloc(rowC, C%nnz)
        C%val  = valC(1:nnzC)
        C%icol = colC(1:nnzC)

    end function matmat
        
        

end module matutils
