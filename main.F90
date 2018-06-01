program main
    use mult
    implicit none
    real (kind = 8), allocatable, dimension(:,:) :: first
    real (kind = 8), allocatable, dimension(:,:) :: second
    real (kind = 8), allocatable, dimension(:,:) :: multiply
    integer (kind = 4) :: i,j, s(4)
    character (len = 12), dimension(:), allocatable :: args

    args_count = command_argument_count()
    allocate(args(args_count))

    do i = 1, args_count
        call get_command_argument(i, args(i))
    end do

    do i = 1, args_counter
        read(args(i), '(i5)') s(i)
    end do

    allocate(first(s(1),s(2)))
    allocate(second(s(3),s(4)))
    allocate(multiply(s(2),s(3)))

    do i = 1,b
        do j = 1,c
            multiply(i,j) = 0.d0
        end do
    end do

    call random_number(first)
    call random_number(second)

    call mm(first, second, multiply)
    call print_array(first, a, b)
    call print_array(second, c, d)
    call print_array(multiply, b, c)
end program
