program cac40
  implicit none

  character(len=60) :: ligne
  integer :: n, i

  ! Ouvrir le fichier 
  open(unit=20, file="cac40.dat", status="old", action="read", iostat=n)
  if (n /= 0) then
     print *, "Erreur "
     stop
  endif
  ! Lire le fichier 
  read(20, '(A)', iostat=n) ligne
  if (n /= 0) then
     print *, "Erreur de lecture"
     stop
  endif
  print *, trim(ligne)

  i = 0
  do
     i = i+1
     read(20, '(A)', iostat=n) ligne
     if (n /= 0) then
        if (is_iostat_end(n)) exit
        print *, "Erreur de lecture du fichier à la ligne ", i
        stop
     endif
     print *, trim(ligne)
  end do

  ! fermer le fichier 
  close(20)
end program cac40
