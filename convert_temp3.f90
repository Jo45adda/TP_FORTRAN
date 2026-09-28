    program convert_temp3
        implicit none
        ! Declaration.
        real :: Deg_F, K
        real :: Deg_C
        ! Instructions.
        print *, "Please type in the temp in F"
        read *, Deg_F
        DEG_C = 5*(Deg_F-32)/9.
        K = Deg_C + 273.15
        print *, "This is equal to", Deg_C, "C and", K,"K"
    end program convert_temp3
