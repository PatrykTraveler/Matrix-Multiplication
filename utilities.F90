module utilities
    implicit none
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
end module