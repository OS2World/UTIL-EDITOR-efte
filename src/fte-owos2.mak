#
# fte-owos2.mak
#
# Copyright (c) 2008, eFTE SF Group (see AUTHORS file)
#
# You may distribute under the terms of either the GNU General Public
# License or the Artistic License, as specified in the README file.
#
#
#----------------------------------------------------------------------------
#
# Makefile for ECS-OS2 version of eFTE using OpenWatcom 1.4
#
# Notes:
#
# 1. clipserv and cliputil are not required for current versions of OS/2. I
#    do not use an older version so I do not include them in this makefile.
#
# 2. OpenWatcom uses & rather than \ as line continuation if objs.mif is not
#    in the src directory wmake -f owconvert.mak will compile watconvert.exe.
#    When run objs.mif will be created from objs.inc.
#
#----------------------------------------------------------------------------
.SILENT

CC = wpp386
LD = wlink
RC = wrc
PERL = perl

# Machine type -5r Pent -6r Pent Pro
MACHINE= -3r

#Optimization None -od  - Fastest possible -otexan
OPT= -ot

INCLUDE = $(%watcom)\h;$(%watcom)\h\os2;.\

# suppress warnings 555 and 013
MISC    = -wcd555 -wcd013 -wcd726

DEFS    = -dOS2 -dOS2OW -dINCL_32 -dWATCOM -dUSE_LOCALE
!ifdef DEBUG
CFLAGS  = -i=$(INCLUDE) $(MISC) $(DEFS) -d3 -db -w4 -e25 -zq $(OPT) $(MACHINE) -bm -bt=OS2 -mf -xs -of+
LDFLAGS = debug all op m op maxe=25 op q op symf op el op stack=128k
!else
CFLAGS  = -i=$(INCLUDE) $(MISC) $(DEFS) -d1 -db -w4 -e25 -zq $(OPT) $(MACHINE) -bm -bt=OS2 -mf -xs -of+-wx
LDFLAGS = op m op maxe=25 op q op symf op el op stack=128k
!endif
OEXT    = obj

.EXTENSIONS:.rc .res

!include objs.mif

.cpp.obj: *.cpp
  $(CC) $(CFLAGS) $<

all: efte.exe eftepm.exe

#cefte.exe: $(CFTE_OBJS) fte.def
#  $(LD) NAME cefte SYS os2v2 $(LDFLAGS) FILE {$(CFTE_OBJS)}

defcfg.h: bin2c.exe simple.fte
  bin2c simple.fte >defcfg.h

bin2c.exe: bin2c.obj
  $(LD) NAME bin2c SYS os2v2 $(LDFLAGS) FILE {bin2c.obj}

c_config.obj: c_config.cpp defcfg.h

efte.exe: $(OBJS) $(VIOOBJS) fte.def
  $(LD) NAME efte SYS os2v2 $(LDFLAGS) FILE {$(OBJS) $(VIOOBJS)}
  $(PERL) ..\tools\mapsymw.pl efte.map

eftepm.res: eftepm.rc pmdlg.rc
  $(RC) -r eftepm.rc eftepm.res

eftepm.exe: $(OBJS) $(PMOBJS) eftepm.res
  $(LD) NAME eftepm SYS os2v2_pm $(LDFLAGS) FILE {$(OBJS) $(PMOBJS)}
  $(RC) eftepm.res eftepm.exe
  $(PERL) ..\tools\mapsymw.pl eftepm.map

clean : .SYMBOLIC
  -@rm *.obj
  -@rm *.exe
  -@rm *.err
  -@rm *.lst
  -@rm *.map
  -@rm *.sym
  -@rm *.res
  -@rm *.mbr
  -@rm *.*~

cleanall : .SYMBOLIC
  -@rm *.obj
  -@rm *.exe
  -@rm *.err
  -@rm *.lst
  -@rm *.map
  -@rm def*.h
  -@rm *.cnf
#  -@rm *.mif
  -@rm *.sym
  -@rm *.res
  -@rm *.mbr
  -@rm *.*~
