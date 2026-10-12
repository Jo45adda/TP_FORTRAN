program convert_temp1
    implicit none
    integer :: Deg_F, Deg_C, K
    print *, "Please type in the temp in F"
    read *, Deg_F
    DEG_C = 5*(Deg_F-32)/9.
    K = Deg_C + 273
    print*, "This is equal to", Deg_C, "C and", K,"K"
end program convert_temp1