!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!                                                                  !!!
!!! Created by Martin Genet, 2008-2016                               !!!
!!!                                                                  !!!
!!! Laboratoire de Mécanique et de Technologie (LMT), Cachan, France !!!
!!! Lawrence Berkeley National Laboratory, California, USA           !!!
!!! University of California at San Francisco, USA                   !!!
!!! Swiss Federal Institute of Technology (ETH), Zurich, Switzerland !!!
!!! École Polytechnique, Palaiseau, France                           !!!
!!!                                                                  !!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

C
C REQUESTED SUBROUTINES
C
C
C ABAQUS UMAT_1D_ELASTICITY SUBROUTINE
C
      SUBROUTINE UMAT(STRESS,STATEV,DDSDDE,SSE,SPD,SCD,RPL,DDSDDT,
     1 DRPLDE,DRPLDT,STRAN,DSTRAN,TIME,DTIME,TEMP,DTEMP,PREDEF,DPRED,
     2 CMNAME,NDI,NSHR,NTENS,NSTATV,PROPS,NPROPS,COORDS,DROT,PNEWDT,
     3 CELENT,DFGRD0,DFGRD1,NOEL,NPT,LAYER,KSPT,KSTEP,KINC)
C
      #include 'ABA_PARAM.INC'
C
      CHARACTER CMNAME(80)
      INTEGER NTENS, NSTATV, NPROPS, NOEL, NPT, KSTEP, KINC
      DOUBLE PRECISION STRESS(NTENS),STATEV(NSTATV),DDSDDE(NTENS,NTENS),
     1 DDSDDT(NTENS),DRPLDE(NTENS),STRAN(NTENS),DSTRAN(NTENS),TIME(2),
     2 PREDEF,DPRED,PROPS(NPROPS),COORDS(3),DROT(3,3),PNEWDT,
     3 DFGRD0(3,3),DFGRD1(3,3)
C
      INTEGER I, J
      DOUBLE PRECISION E, STRANI
C
!       PRINT *, "KINC (increment number) =", KINC
!       PRINT *, "NOEL (element number) =", NOEL
!       PRINT *, "NPT (integration point number) =", NPT
!       PRINT *, "KSTEP (step number) =", KSTEP
!       PRINT *, "NSTATV (number of state variables) =", NSTATV
!       PRINT *, "STATEV (state variables)"
!       DO I = 1, NSTATV
!           PRINT *, STATEV(I)
!       END DO
!       PRINT *, "STRESS (stress at the begining of the increment)"
!       DO I = 1, NTENS
!           PRINT *, STRESS(I)
!       END DO
!       PRINT *, "STRAN (total strain at the begining of the increment)"
!       DO I = 1, NTENS
!           PRINT *, STRAN(I)
!       END DO
!       PRINT *, "DSTRAN (total strain increment for the iteration)"
!       DO I = 1, NTENS
!           PRINT *, DSTRAN(I)
!       END DO
C
      E = PROPS(1)
C
      STRANI = STRAN(1) + DSTRAN(1)
C
      DDSDDE(1, 1) = E
C
      STRESS(1) = DDSDDE(1, 1) * STRANI
C
!       PRINT *, "STRESS (stress at the end of the iteration)"
!       DO I = 1, NTENS
!           PRINT *, 'STRESS(', I, ') = ', STRESS(I)
!       END DO
!       PRINT *, "DDSDDE"
!       DO I = 1, NTENS
!         DO J = 1, I
!           PRINT *, 'K(', I, ' ,', J, ' ) =', DDSDDE(I, J)
!         ENDDO
!       ENDDO
C
      RETURN
      END
