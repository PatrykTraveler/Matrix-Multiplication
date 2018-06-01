module mult
    implicit none
    contains
        subroutine mm(first, second, multiply)
            implicit none
            real (kind = 8), intent(in) :: first(:, :)
            real (kind = 8), intent(in) :: second(:, :)
            real (kind = 8), intent(out) :: multiply(:, :)
            integer (kind = 4) :: status, first_size(2), second_size(2), i,j,k

            first_size = shape(first)
            second_size = shape(second)

            if(first_size(1) /= second_size(2)) then
                status = 1
                return
            end if

            do i=1, first_size(2)
                do j=1, second_size(1)
                    do k=1, first_size(1)
                        multiply(i, j) = multiply(i, j) + first(k, i)*second(j, k)
                    end do
                end do
            end do
            status = 0

        end subroutine

        subroutine print_array(array, N, M)
            implicit none
            real (kind = 8), intent(in) :: array(:,:)
            integer (kind = 4), intent(in) :: N, M
            integer (kind = 4) :: i, j

            do i=1,N
                write(*, '(1000F14.3)')( real(array(i,j)) ,j=1,M)
            end do
            write (*,*) NEW_LINE('')
        end subroutine
end module