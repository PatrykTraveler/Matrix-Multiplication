program main
    use mult
    use utilities
    implicit none
    real (kind = 8), allocatable, dimension(:,:) :: first
    real (kind = 8), allocatable, dimension(:,:) :: second
    real (kind = 8), allocatable, dimension(:,:) :: multiply
    integer (kind = 4) :: i,j, args_count, status, s(4)
    character (len = 12), dimension(:), allocatable :: args

    args_count = command_argument_count()
    allocate(args(args_count))

    do i = 1, args_count
        call get_command_argument(i, args(i))
    end do

    do i = 1, args_count
        read(args(i), '(i5)') s(i)
    end do

    allocate(first(s(1),s(2)))
    allocate(second(s(3),s(4)))
    allocate(multiply(s(2),s(3)))

    multiply = 0.d0

    call random_number(first)
    call random_number(second)

    call mm(first, second, multiply, status)
    if(status == 0) then
        write(*, *) "FIRST ARRAY"
        call print_array(first, s(1), s(2))
        write(*, *) "SECOND ARRAY"
        call print_array(second, s(3), s(4))
        write(*, *) "RESULT"
        call print_array(multiply, s(2), s(3))
    end if

    deallocate(first)
    deallocate(second)
    deallocate(multiply)
end program
