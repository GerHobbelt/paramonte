module logfunc
    use pm_kind, only: IK, RKC => RKD ! all processor kinds are supported.
    integer(IK), parameter :: NDIM = 2
contains
    recursive function getLogFunc(state) result(logFunc)
        ! Return the negative natural logarithm of Himmelblau function evaluated at the input vector state.
        real(RKC), intent(in), contiguous :: state(:)
        real(RKC) :: logFunc
        if (size(state) /= 2) error stop "The input state vector size must be 2."
        logFunc = -log((state(1)**2 + state(2) - 11)**2 + (state(1) + state(2)**2 - 7)**2 + 0.1_RKC)
    end function
end module logfunc

program example
    use logfunc, only: NDIM, getLogFunc
    use pm_sampling, only: getErrSampling, paradram_type, err_type
    type(err_type) :: err
    err = getErrSampling(paradram_type(outputFileName = './out/himmelblau', inputFile = 'input.nml'), getLogFunc, NDIM)
    if (err%occurred) error stop "sampler failed: "//err%msg
end program example