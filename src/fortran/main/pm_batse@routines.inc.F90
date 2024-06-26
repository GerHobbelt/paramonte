 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!                                                                                                                            !!!!
!!!!    ParaMonte: Parallel Monte Carlo and Machine Learning Library.                                                           !!!!
!!!!                                                                                                                            !!!!
!!!!    Copyright (C) 2012-present, The Computational Data Science Lab                                                          !!!!
!!!!                                                                                                                            !!!!
!!!!    This file is part of the ParaMonte library.                                                                             !!!!
!!!!                                                                                                                            !!!!
!!!!    LICENSE                                                                                                                 !!!!
!!!!                                                                                                                            !!!!
!!!!       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md                                                          !!!!
!!!!                                                                                                                            !!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!>  \brief
!>  This include file contains the implementations of procedures of [pm_batse](@ref pm_batse).
!>
!>  \final
!>
!>  \author
!>  \AmirShahmoradi, Oct 16, 2009, 11:14 AM, Michigan

!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        !%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#if     getCorrectionLogEffPPF_ENABLED
        !%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        real(RKG), parameter :: THRESH_ERFC_AMP_RKG = real(THRESH_ERFC_AMP, RKG)
        real(RKG), parameter :: THRESH_ERFC_AVG_RKG = real(THRESH_ERFC_AVG, RKG)
        real(RKG), parameter :: THRESH_ERFC_STD_INV_RKG = real(THRESH_ERFC_STD_INV, RKG)
        correction = THRESH_ERFC_AMP_RKG * erfc((logT90 - THRESH_ERFC_AVG_RKG) / THRESH_ERFC_STD_INV_RKG)
        ! + THRESH_ERFC_BASE ! adding this term will make the effective peak flux equivalent to PF1024ms

        !%%%%%%%%%%%%%%%%%%%
#elif   getLogEffPPF_ENABLED
        !%%%%%%%%%%%%%%%%%%%

        logEffPPF  = logPPF64 - getCorrectionLogEffPPF(logT90)

        !%%%%%%%%%%%%%%%%%%%
#elif   getLogEffPPF_ENABLED
        !%%%%%%%%%%%%%%%%%%%

        logEffPPF  = logPPF64 - getCorrectionLogEffPPF(logT90)

        !%%%%%%%%%%%%%%%%%
#elif   getLogPbol_ENABLED
        !%%%%%%%%%%%%%%%%%

        logPbol = logPF53 - getLogPF53(logEpk, 0._RKG)

        !%%%%%%%%%%%%%%%%%
#elif   getLogPF53_ENABLED
        !%%%%%%%%%%%%%%%%%

        real(RKG), parameter :: LOGPF53_MINUS_LOGPBOL_RKG = real(LOGPF53_MINUS_LOGPBOL, RKG)
        if (logEpk < -6.712165960423344_RKG) then
            logPF53 = logPbol   + LOGPF53_MINUS_LOGPBOL_RKG ! 11.328718657530706
        elseif (logEpk < 3.453877639491069_RKG) then
            logPF53 = logPbol   + 13.20790440362500600_RKG + logEpk * &
                                ( 0.309360000000000000_RKG + logEpk * &
                                ( 0.001980382837478830_RKG + logEpk * &
                                ( 0.000299892598248466_RKG + logEpk * &
                                ( 1.25602147173493e-05_RKG - logEpk   &
                                * 1.27171265917873e-05_RKG ))))
        elseif (logEpk < 5.756462732485115_RKG) then
            logPF53 = logPbol   + 4.400884836537660000_RKG + logEpk * &
                                ( 39.71039000000000000_RKG - logEpk * &
                                ( 41.95557432120050000_RKG - logEpk * &
                                ( 20.60525451895990000_RKG - logEpk * &
                                ( 5.510436247342930000_RKG - logEpk * &
                                ( 0.832525333390336000_RKG - logEpk * &
                                ( 0.067135977132248900_RKG - logEpk   &
                                * 0.002254876138523550_RKG ))))))
        elseif (logEpk < 9.210340371976184_RKG) then
            logPF53 = logPbol   + 6.451981585674900000_RKG + logEpk * &
                                ( 4.569070000000000000_RKG - logEpk * &
                                ( 0.837198158654537000_RKG - logEpk * &
                                ( 0.055416002698982300_RKG - logEpk   &
                                * 0.001219684856402480_RKG )))
        elseif (logEpk < 12.455573549219071_RKG) then
            logPF53 = logPbol   - 24.09731285126340000_RKG + logEpk * &
                                ( 26.70637000000000000_RKG - logEpk * &
                                ( 6.286981551320860000_RKG - logEpk * &
                                ( 0.667762738216888000_RKG - logEpk * &
                                ( 0.033549115287895400_RKG - logEpk   &
                                * 0.000651366755890191_RKG ))))
        else
            logPF53 = logPbol   + LOGPF53_MINUS_LOGPBOL_RKG
        end if
        !write(*,"(*(g0.13,:,', '))") "logEpk, logPbol, logPF53<0.0: ", logEpk, logPbol, logPF53

        !%%%%%%%%%%%%%%%%%%%
#elif   getLog10PF53_ENABLED
        !%%%%%%%%%%%%%%%%%%%

        real(RKG), parameter :: LOG10PF53_MINUS_LOG10PBOL_RKG = real(LOG10PF53_MINUS_LOG10PBOL, RKG)
        if (log10epk < -2.915056638230699_RKG) then
            log10PF53 = log10pbol    + LOG10PF53_MINUS_LOG10PBOL_RKG ! 4.9200000000000000_RKG
        elseif (log10epk < 1.5_RKG) then
            log10PF53 = log10pbol   + 5.7361200000000000_RKG + log10epk * &
                                    ( 0.3093600000000000_RKG + log10epk * &
                                    ( 0.0045600000000000_RKG + log10epk * &
                                    ( 0.0015900000000000_RKG + log10epk * &
                                    ( 0.0001533360000000_RKG - log10epk   &
                                    * 0.0003574800000000_RKG ))))
        elseif (log10epk < 2.5_RKG) then
            log10PF53 = log10pbol   + 1.9112800000000000_RKG + log10epk * &
                                    ( 39.710390000000000_RKG - log10epk * &
                                    ( 96.606280000000000_RKG - log10epk * &
                                    ( 109.24696000000000_RKG - log10epk * &
                                    ( 67.271800000000000_RKG - log10epk * &
                                    ( 23.402390000000000_RKG - log10epk * &
                                    ( 4.3454400000000000_RKG - log10epk   &
                                    * 0.3360600000000000_RKG ))))))
        elseif (log10epk < 4._RKG) then
            log10PF53 = log10pbol   + 2.8020600000000000_RKG + log10epk * &
                                    ( 4.5690700000000000_RKG - log10epk * &
                                    ( 1.9277200000000000_RKG - log10epk * &
                                    ( 0.2938100000000000_RKG - log10epk   &
                                    * 0.0148900000000000_RKG )))
        elseif (log10epk < 5.4093868613659435_RKG) then
            log10PF53 = log10pbol   - 10.465330000000000_RKG + log10epk * &
                                    ( 26.706370000000000_RKG - log10epk * &
                                    ( 14.476310000000000_RKG - log10epk * &
                                    ( 3.5404100000000000_RKG - log10epk * &
                                    ( 0.4095700000000000_RKG - log10epk   &
                                    * 0.0183100000000000_RKG ))))
        else ! if (log10epk>=5.4093868613659435_RKG) then
            log10PF53 = log10pbol   + LOG10PF53_MINUS_LOG10PBOL_RKG
        end if

#else
        !%%%%%%%%%%%%%%%%%%%%%%%%
#error  "Unrecognized interface."
        !%%%%%%%%%%%%%%%%%%%%%%%%
#endif