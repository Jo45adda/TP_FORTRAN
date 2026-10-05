program convert_temp2
        implicit none
        ! Declaration
        integer:: Deg_C, Deg_F, K
        ! Instructions
        print*, "Please type temp in C"
        read*, Deg_C
        Deg_F = (9*Deg_C)/5+32
        K = Deg_C + 273
        print*, "This is equal to", Deg_F, "F and", K,"K"
end program convert_temp2
        
