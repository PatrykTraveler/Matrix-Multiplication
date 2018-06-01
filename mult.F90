module mult
    implicit none
    contains
        subroutine mm(first, second, multiply, status)
            implicit none
            real (kind = 8), intent(in) :: first(:, :)
            real (kind = 8), intent(in) :: second(:, :)
            real (kind = 8), intent(out) :: multiply(:, :)
            integer (kind = 4) :: status
            integer (kind = 4) :: first_size(2), second_size(2), i,j,k

            first_size = shape(first)
            second_size = shape(second)

            if(first_size(1) /= second_size(2)) then
                write(*,*) "Unable to perform matrix multiplication"
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

        subroutine mm_dot(first, second, multiply, status)
            implicit none
            real (kind = 8), intent(in) :: first(:, :)
            real (kind = 8), intent(in) :: second(:, :)
            real (kind = 8), intent(out) :: multiply(:, :)
            integer (kind = 4) :: status
            integer (kind = 4) :: first_size(2), second_size(2), i,j

            first_size = shape(first)
            second_size = shape(second)

            if(first_size(1) /= second_size(2)) then
                write(*,*) "Unable to perform matrix multiplication"
                status = 1
                return
            end if

            do i=1, first_size(2)
                do j=1, second_size(1)
                    multiply(i,j) = dot_product(first(:, i),second(j, :))
                end do
            end do
            status = 0

        end subroutine

        subroutine mm_mul(first, second, multiply, status)
            implicit none
            real (kind = 8), intent(in) :: first(:, :)
            real (kind = 8), intent(in) :: second(:, :)
            real (kind = 8), intent(out) :: multiply(:, :)
            integer (kind = 4) :: status
            integer (kind = 4) :: first_size(2), second_size(2)

            first_size = shape(first)
            second_size = shape(second)

            if(first_size(1) /= second_size(2)) then
                write(*,*) "Unable to perform matrix multiplication"
                status = 1
                return
            end if

            multiply = matmul(second, first)
            status = 0

        end subroutine
end module