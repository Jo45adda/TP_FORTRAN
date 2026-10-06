program convert_temp2
    implicit none 
    integer :: Deg_F,Deg_C, K
    print *, "please type in the temp in C"
    read *, Deg_C
    Deg_F = (9. * Deg_C) / 5 + 32
    K = Deg_C + 273
    print *, "This is equal to", Deg_F, "F and", K, "K"
    ! ça donne 44F et 280K 
end program convert_temp2