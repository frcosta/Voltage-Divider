! Voltage Divider Calculation
! GNU Fortran (tdm64-1) 10.3.0 on Windows 11
! Fabiano Costa Sep/20/2025
! compile: make all 

program res_divider
    use iso_c_binding
    implicit none
    
    integer(c_int) :: k
    real :: Vin, Vout, r1, r2

    interface
        function getch() bind(C, name="getch")
          import :: c_int
          integer(c_int) :: getch
        end function getch
    end interface

    write(*,'(/, A, /)') '==== Voltage divider Calc ===='
    write(*,'(A)')       '1) Vout? Select Vin, R1, R2'
    write(*,'(A)')       '2) R1?   Select Vin, Vout, R2'
    write(*,'(A, /)')    '3) R2?   Select Vin, Vout, R1'
    write(*,'(A)')       '=============================='
    write(*,'(A)', advance="no") 'Select your choice: '
    k = getch()

    select case (k)
    case (49)
        write(*,'(2/,A)') 'Vout calculation based on Vin, R1 and R2'
        write(*,'(A)', advance="no") 'Enter Vin, R1, R2  separated by commas: '
        read(*,*) Vin, r1, r2
        Vout = (r2 / (r2 + r1)) * Vin
        write(*,'(/, A, F5.2, A)') 'Vout = ', Vout, ' Volts'
    case (50)
        write(*,'(2/,A)') 'R1 calculation based on Vin, Vout and R2'
        write(*,'(A)', advance="no") 'Enter Vin, Vout, R2 separated by commas: '
        read(*,*) Vin, Vout, r2
        r1 = ((r2 * Vin) / Vout) - r2
        write(*,'(/, A, F8.2, A)') 'R1 = ', r1, ' Ohms'
    case (51)
        write(*,'(2/,A)') 'R2 calculation based on Vin, Vout and R1'
        write(*,'(A)', advance="no") 'Enter Vin, Vout, R1 separated by commas: '
        read(*,*) Vin, Vout, r1
        r2 = (Vout * r1) / (Vin - Vout)
        write(*,'(/, A, F8.2, A)') 'R2 = ', r2, ' Ohms'
    end select

end program res_divider