*"ɽ�� ����Ĵ�´ؿ��ν��� GTOOL3(GPASPS)
*
*"���� 91/01/17 �¸�  ��
*
*
**********************************************************************
*"      << ����Ĵ�´ؿ��ν��� >>
**********************************************************************
      SUBROUTINE GPASPS
     I         ( IMAX  , JMAX  , KMAX  , ER    ,
     O           PNM   , DPNM  , TRIGS , IFAX  ,
     O           NMO   , GW    , COSLAT,
     O           LMAX  , MMAX  , NMAX  , MINT  ,
     O           NMDIM , JMXHF ,
     W           QPNM  , QDPNM , QGW   , QSINLA          )
*
      INTEGER    IMAX
      INTEGER    JMAX
      REAL       ER                          !" �ϵ�Ⱦ��
*
      REAL       PNM   ( * )                 !" ��nm �른���ɥ�
      REAL       DPNM  ( * )                 !" ��nm ����ʬ
      REAL       TRIGS ( * )                 !" ���Ѵؿ�ɽ
      INTEGER    IFAX  ( * )                 !" IMAX �ΰ���ʬ��
*
      INTEGER    NMO   ( * )                 !" ���ڥ��ȥ��ź������
      REAL       GW    ( * )                 !" �������ٽ�
      REAL       COSLAT( * )                 !" cos(����)
*
      REAL*8     QPNM  ( * )                 !" ��nm �른���ɥ�
      REAL*8     QDPNM ( * )                 !" ��nm ����ʬ
      REAL*8     QGW   ( * )                 !" �������ٽ� ��������
      REAL*8     QSINLA( * )                 !" sin(����) (������
*
      INTEGER    IMAX0 , JMAX0               !" ���å���
      INTEGER    IMAXD , JMAXD, KMAXD        !" �ΰ���礭��
      CHARACTER  HMSG *100
*
      DATA       IMAX0 , JMAX0 / 0, 0 /
      DATA       IMAXD , JMAXD, KMAXD / 0, 0, 0 /
      SAVE
*
      IF ( ( IMAXD*JMAXD*KMAXD .NE. 0 )
     &             .AND.
     &     ( ( IMAX .GT. IMAXD ) .OR. ( JMAX .GT. JMAXD )
     &                           .OR. ( KMAX .GT. KMAXD ) ) ) THEN
*
         HMSG = 'INSUFFICIENT SPACE: IMAX= '
         NH = LENC( HMSG )
         WRITE ( HMSG(NH+1:NH+9), '(I4,1X,I4)' ) IMAX,IMAXD
         HMSG(NH+10:100) = ', JMAX= '
         NH = LENC( HMSG )
         WRITE ( HMSG(NH+1:NH+9), '(I4,1X,I4)' ) JMAX,JMAXD
         HMSG(NH+10:100) = ', KMAX= '
         NH = LENC( HMSG )
         WRITE ( HMSG(NH+1:NH+9), '(I4,1X,I4)' ) KMAX,KMAXD
*
         CALL MSGDMP('E', 'GPASPS', HMSG )
      ENDIF
*
*"         < 1. �ȿ������ѷ����Ǥξ��Τߡ� >
*
      MMAX  = IMAX     / 3
      LMAX  = (JMAX*2) / 3
      NMAX  = MAX( MMAX, LMAX )
      MINT  = 1
      NML   = NMAX-LMAX
      IF ( MMAX .EQ. 0 ) THEN
         NMDIM = LMAX+1
      ELSE
         NMDIM = (MMAX/MINT+1)*(2*(NMAX+1)-LMAX)-NML*(NML+1)
      ENDIF
      JMXHF = JMAX/2+1
*
      IF ( ( IMAX .NE. IMAX0 ) .OR. ( JMAX .NE. JMAX0 ) ) THEN
*
         IMAX0 = IMAX
         JMAX0 = JMAX
*
*"         < 2. FFT�ν��� >
*
         IF ( IMAX .GE. 2 ) THEN
            CALL RFFTIM
     I            ( IMAX  ,
     O              TRIGS , IFAX )
         ENDIF
*
*"         < 3. �른���ɥ�ؿ��η׻� >
*
         IF ( JMAX .GE. 2 ) THEN
*
            CALL GAUSS
     O         ( QSINLA , QGW   ,
     I           JMAX            )
*
            CALL SETPNM
     O         ( PNM   , DPNM  , NMO   ,
     I           QSINLA,
     D           JMAX  , MMAX  , LMAX  , NMAX  , MINT  ,
     D           NMDIM , JMXHF ,
     W           QPNM  , QDPNM                                  )
*
*"         < 4. �������ٽ� >
*
            DO 4100 J = 1, JMAX
               GW    ( J ) = QGW( J )
               COSLAT( J ) = SQRT( 1.D0 - QSINLA(J)**2 )
 4100       CONTINUE
*
         ENDIF
*
      ENDIF
*
      RETURN
*=====================================================================
*"    << ����Ĵ�´ؿ��ΰ���礭������ >>
*=====================================================================
      ENTRY      GPASPW
     I         ( IMAXDW, JMAXDW, KMAXDW )
*
      IMAXD = IMAXDW
      JMAXD = JMAXDW
      KMAXD = KMAXDW
*
      END
