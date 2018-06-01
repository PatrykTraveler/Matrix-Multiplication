module utilities
    implicit none
    contains
        subroutine print_array(array, N, M)
            implicit none
            real (kind = 8), intent(in) :: array(:,:)
            integer (kind = 4), intent(in) :: N, M
            integer (kind = 4) :: i, j
            real (kind = 8) :: transposed_array(M, N)

            transposed_array = transpose(array)

            do i=1,N
                write(*, '(1000F14.3)')( real(array(i,j)) ,j=1,M)
            end do
            write (*,*) NEW_LINE('')
        end subroutine

        subroutine save_results(dtime, filename)
            logical :: exist
            real (kind = 8) :: dtime
            character (len = 32) :: filename

            inquire(file=filename, exist=exist)
            if(exist) then
                open(7, file=filename, status="old", position="append", action="write")
            else
                open(7, file=filename, status="new", action="write")
            end if

            write(7, '(F14.3)') dtime
            close(7)
        end subroutine
end module