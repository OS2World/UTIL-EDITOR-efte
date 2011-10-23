# src\help\makefile - build help file(s)
# 

# Copyright (c) 2011 Gregg Young

# 04 Jul 11 GKY Baseline

!ifndef USE_WIPFC			# if not defined on command line
!ifdef %USE_WIPFC			# if defined in environment
USE_WIPFC = $(%USE_WIPFC)
!endif
!endif

!ifndef USE_IPFC			# if not defined on command line
!ifdef %USE_IPFC			# if defined in environment
USE_IPFC = $(%USE_IPFC)
!endif
!endif

!ifdef USE_IPFC
IPFC = ipfc
IFLAGS = /CODEPAGE=850
!else
IPFC = wipfc
IFLAGS = -l en_US
!endif

all: eFTE2.hlp .symbolic

eFTE2.hlp: *.ipf 
  set WIPFC=$(%WATCOM)\wipfc
  $(IPFC) $(IFLAGS) eFTE2.ipf

clean: .symbolic
   -del *.hlp
   -del *~
