program area
        implicit none
        real:: radius, area_val, volume
        real, parameter:: pi=4.0*atan(1.0)
        do
                print*, "Type in radius, a negative value will terminate"
                read*, radius
                if (radius < 0.0) exit
                
                area_val = pi*radius**2
                volume = (4.0*pi*radius**3)/3.0
                        
                print*, "Area of circle with radius R =", &
                                radius, "is A =", area_val
                print*, "Volume of sphere with radius", &
                                radius,"is", volume
        end do
end program area


