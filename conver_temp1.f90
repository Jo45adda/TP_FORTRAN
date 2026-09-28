program convert_temp1
        implicit none
        ! Declaration
        integer:: Deg_C, Deg_F, K
        ! Instructions
        print*, "Please type the temp in F"
        read*, Deg_F
        Deg_C = 5*(Deg_F-32)/9.
        K = Deg_C + 273
        print*, "This is equal to", Deg_C,"C and ", K,"K"
end program convert_temp1
