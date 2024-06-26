program example

    use pm_kind, only: LK
    use pm_kind, only: SK ! All kinds are supported.
    use pm_kind, only: IK ! All kinds are supported.
    use pm_kind, only: CK ! All kinds are supported.
    use pm_kind, only: RK ! All kinds are supported.
    use pm_io, only: display_type
    use pm_arrayCenter, only: getCentered

    implicit none

    character(:, SK), allocatable   :: string_SK    
    character(2, SK), allocatable   :: array_SK(:)  ! Can be any processor-supported kind.
    logical(LK)     , allocatable   :: array_LK(:)  ! Can be any processor-supported kind.
    integer(IK)     , allocatable   :: array_IK(:)  ! Can be any processor-supported kind.
    complex(CK)     , allocatable   :: array_CK(:)  ! Can be any processor-supported kind.
    real(RK)        , allocatable   :: array_RK(:)  ! Can be any processor-supported kind.

    type(display_type) :: disp

    disp = display_type(file = "main.out.F90")

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Expand and center an array to a new larger size.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call reset()

    allocate(array_SK(3:8), source = [SK_"AA", SK_"BB", SK_"CC", SK_"DD", SK_"EE", SK_"FF"])
    allocate(array_IK(3:8), source = [1_IK, 2_IK, 3_IK, 4_IK, 5_IK, 6_IK])
    allocate(array_RK(3:8), source = [1._RK, 2._RK, 3._RK, 4._RK, 5._RK, 6._RK])
    allocate(array_CK(3:8), source = [(1._CK, -1._CK), (2._CK, -2._CK), (3._CK, -3._CK), (4._CK, -4._CK), (5._CK, -5._CK), (6._CK, -6._CK)])
    allocate(array_LK(3:8), source = [.true._LK, .true._LK, .true._LK, .true._LK, .true._LK, .true._LK])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center character scalar.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    string_SK = SK_"ABCDEF"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 8_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 8_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center character array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_SK")
    call disp%show( array_SK, deliml = SK_"""" )
    call disp%show("lbound(array_SK), ubound(array_SK)")
    call disp%show([lbound(array_SK), ubound(array_SK)])
    call disp%show("array_SK = getCentered(array_SK, size = 8_IK, fill = SK_'%%')")
                    array_SK = getCentered(array_SK, size = 8_IK, fill = SK_'%%')
    call disp%show("array_SK")
    call disp%show( array_SK, deliml = SK_"""" )
    call disp%show("lbound(array_SK), ubound(array_SK)")
    call disp%show([lbound(array_SK), ubound(array_SK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center logical array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_LK")
    call disp%show( array_LK )
    call disp%show("lbound(array_LK), ubound(array_LK)")
    call disp%show([lbound(array_LK), ubound(array_LK)])
    call disp%show("array_LK = getCentered(array_LK, size = 8_IK, fill = .false._LK)")
                    array_LK = getCentered(array_LK, size = 8_IK, fill = .false._LK)
    call disp%show("array_LK")
    call disp%show( array_LK )
    call disp%show("lbound(array_LK), ubound(array_LK)")
    call disp%show([lbound(array_LK), ubound(array_LK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center integer array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_IK")
    call disp%show( array_IK )
    call disp%show("lbound(array_IK), ubound(array_IK)")
    call disp%show([lbound(array_IK), ubound(array_IK)])
    call disp%show("array_IK = getCentered(array_IK, size = 8_IK, fill = -9999_IK)")
                    array_IK = getCentered(array_IK, size = 8_IK, fill = -9999_IK)
    call disp%show("array_IK")
    call disp%show( array_IK )
    call disp%show("lbound(array_IK), ubound(array_IK)")
    call disp%show([lbound(array_IK), ubound(array_IK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center complex array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_CK")
    call disp%show( array_CK )
    call disp%show("lbound(array_CK), ubound(array_CK)")
    call disp%show([lbound(array_CK), ubound(array_CK)])
    call disp%show("array_CK = getCentered(array_CK, size = 8_IK, fill = (-999._CK,-999._CK))")
                    array_CK = getCentered(array_CK, size = 8_IK, fill = (-999._CK,-999._CK))
    call disp%show("array_CK")
    call disp%show( array_CK )
    call disp%show("lbound(array_CK), ubound(array_CK)")
    call disp%show([lbound(array_CK), ubound(array_CK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center real array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_RK")
    call disp%show( array_RK )
    call disp%show("lbound(array_RK), ubound(array_RK)")
    call disp%show([lbound(array_RK), ubound(array_RK)])
    call disp%show("array_RK = getCentered(array_RK, size = 8_IK, fill = 0._RK)")
                    array_RK = getCentered(array_RK, size = 8_IK, fill = 0._RK)
    call disp%show("array_RK")
    call disp%show( array_RK )
    call disp%show("lbound(array_RK), ubound(array_RK)")
    call disp%show([lbound(array_RK), ubound(array_RK)])


    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Shrink an array to a new smaller size. Note that fill has no effect because the array shrinks.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call reset()

    string_SK = SK_"ABCDEF"
    allocate(array_SK(3:8), source = [SK_"AA", SK_"BB", SK_"CC", SK_"DD", SK_"EE", SK_"FF"])
    allocate(array_IK(3:8), source = [1_IK, 2_IK, 3_IK, 4_IK, 5_IK, 6_IK])
    allocate(array_RK(3:8), source = [1._RK, 2._RK, 3._RK, 4._RK, 5._RK, 6._RK])
    allocate(array_CK(3:8), source = [(1._CK, -1._CK), (2._CK, -2._CK), (3._CK, -3._CK), (4._CK, -4._CK), (5._CK, -5._CK), (6._CK, -6._CK)])
    allocate(array_LK(3:8), source = [.true._LK, .true._LK, .true._LK, .true._LK, .true._LK, .true._LK])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center character scalar.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 3_IK, fill = '~')")
                    string_SK = getCentered(string_SK, size = 3_IK, fill = '~')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center character array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_SK")
    call disp%show( array_SK, deliml = SK_"""" )
    call disp%show("lbound(array_SK), ubound(array_SK)")
    call disp%show([lbound(array_SK), ubound(array_SK)])
    call disp%show("array_SK = getCentered(array_SK, size = 3_IK, fill = '**')")
                    array_SK = getCentered(array_SK, size = 3_IK, fill = '**')
    call disp%show("array_SK")
    call disp%show( array_SK, deliml = SK_"""" )
    call disp%show("lbound(array_SK), ubound(array_SK)")
    call disp%show([lbound(array_SK), ubound(array_SK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center logical array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_LK")
    call disp%show( array_LK )
    call disp%show("lbound(array_LK), ubound(array_LK)")
    call disp%show([lbound(array_LK), ubound(array_LK)])
    call disp%show("array_LK = getCentered(array_LK, size = 3_IK, fill = .false._LK)")
                    array_LK = getCentered(array_LK, size = 3_IK, fill = .false._LK)
    call disp%show("array_LK")
    call disp%show( array_LK )
    call disp%show("lbound(array_LK), ubound(array_LK)")
    call disp%show([lbound(array_LK), ubound(array_LK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center integer array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_IK")
    call disp%show( array_IK )
    call disp%show("lbound(array_IK), ubound(array_IK)")
    call disp%show([lbound(array_IK), ubound(array_IK)])
    call disp%show("array_IK = getCentered(array_IK, size = 3_IK, fill = 0_IK)")
                    array_IK = getCentered(array_IK, size = 3_IK, fill = 0_IK)
    call disp%show("array_IK")
    call disp%show( array_IK )
    call disp%show("lbound(array_IK), ubound(array_IK)")
    call disp%show([lbound(array_IK), ubound(array_IK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center complex array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_CK")
    call disp%show( array_CK )
    call disp%show("lbound(array_CK), ubound(array_CK)")
    call disp%show([lbound(array_CK), ubound(array_CK)])
    call disp%show("array_CK = getCentered(array_CK, size = 3_IK, fill = (0._CK, 0._CK))")
                    array_CK = getCentered(array_CK, size = 3_IK, fill = (0._CK, 0._CK))
    call disp%show("array_CK")
    call disp%show( array_CK )
    call disp%show("lbound(array_CK), ubound(array_CK)")
    call disp%show([lbound(array_CK), ubound(array_CK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Center real array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%show("array_RK")
    call disp%show( array_RK )
    call disp%show("lbound(array_RK), ubound(array_RK)")
    call disp%show([lbound(array_RK), ubound(array_RK)])
    call disp%show("array_RK = getCentered(array_RK, size = 3_IK, fill = +0._RK)")
                    array_RK = getCentered(array_RK, size = 3_IK, fill = +0._RK)
    call disp%show("array_RK")
    call disp%show( array_RK )
    call disp%show("lbound(array_RK), ubound(array_RK)")
    call disp%show([lbound(array_RK), ubound(array_RK)])

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Example of perfect array centering.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    string_SK = SK_"ABC"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 7_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 7_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    string_SK = SK_"ABC"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 1_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 1_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    string_SK = SK_"AB"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 6_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 6_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Example of imperfect array centering.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    string_SK = SK_"ABC"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 6_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 6_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    string_SK = SK_"ABC"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 2_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 2_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    string_SK = SK_"AB"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 3_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 3_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    string_SK = SK_"AB"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 1_IK, fill = SK_'-')")
                    string_SK = getCentered(string_SK, size = 1_IK, fill = SK_'-')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Centering array contents within a given size, padded by left and right margins.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    string_SK = SK_"In God We Trust"
    call disp%show("string_SK")
    call disp%show( string_SK , deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 45_IK, fill = SK_' ', lmsize = 4_IK, rmsize = 4_IK, lmfill = SK_'*', rmfill = SK_'*')")
                    string_SK = getCentered(string_SK, size = 45_IK, fill = SK_' ', lmsize = 4_IK, rmsize = 4_IK, lmfill = SK_'*', rmfill = SK_'*')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    string_SK = SK_"ABCDEF"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 8_IK, lmsize = 3_IK, rmsize = 5_IK, fill = SK_'-', lmfill = SK_'*', rmfill = SK_'+')")
                    string_SK = getCentered(string_SK, size = 8_IK, lmsize = 3_IK, rmsize = 5_IK, fill = SK_'-', lmfill = SK_'*', rmfill = SK_'+')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

    string_SK = SK_"ABCDEF"
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%show("string_SK = getCentered(string_SK, size = 2_IK, lmsize = 3_IK, rmsize = 5_IK, fill = SK_'-', lmfill = SK_'*', rmfill = SK_'+')")
                    string_SK = getCentered(string_SK, size = 2_IK, lmsize = 3_IK, rmsize = 5_IK, fill = SK_'-', lmfill = SK_'*', rmfill = SK_'+')
    call disp%show("string_SK")
    call disp%show( string_SK, deliml = SK_"""" )
    call disp%show("len(string_SK)")
    call disp%show( len(string_SK) )
    call disp%skip()

contains

    subroutine reset()
        if (allocated(array_SK)) deallocate(array_SK)
        if (allocated(array_IK)) deallocate(array_IK)
        if (allocated(array_RK)) deallocate(array_RK)
        if (allocated(array_CK)) deallocate(array_CK)
        if (allocated(array_LK)) deallocate(array_LK)
    end subroutine

end program example