# warpin\makefile - build the eFTE/2 Warpin installation file: eFTE2$(EFTE2_VER).WPI

# $Id: makefile 1679 2013-01-01 21:42:27Z gyoung $


!ifndef EFTE2_VER                  # if defined on wmake command, use it
EFTE2_VER=-1-0-0                   # default value
!ifdef %EFTE2_VER                  # if defined via env. var.
EFTE2_VER=$(%EFTE2_VER)            #   use the env. var.
!endif
!endif

all: wpi .symbolic


wpi: chksed checkfiles eFTE2$(EFTE2_VER).wpi eFTE2.wis .symbolic

checkfiles: .symbolic
   @echo Checking to see if files have been changed...
    ckfiles "MAKEOPTS=$(__MAKEOPTS__)" eFTE2$(EFTE2_VER).wpi

chksed: .symbolic
   @sed -V <nul 2>&1 | grep -i "GNU sed" >nul 2>&1 || (@echo. & @echo GNU SED and GREP required and not found on the PATH. & @echo.)

eFTE2.wis: eFTE2.wis.in makefile
   @echo Resetting SED commands
   @%write  sed.in s/@@@EFTE2_VER@@@/$(EFTE2_VER)/
   @%append sed.in /PACKAGEID/s/-/\\/g
   @%append sed.in /@@@include/{s/@@@include//;N;s/\n//}
   @echo Inserting the new Warpin script into the WPI file...
   sed -f sed.in eFTE2.wis.in >eFTE2.wis
   bld_eFTE2_wpi eFTE2$(EFTE2_VER).wpi /SCRIPT

eFTE2$(EFTE2_VER).wpi: bld_eFTE2_wpidirs.in makefile
   @echo Staging files for WPI file...
   bld_eFTE2_wpidirs
   @echo Creating/updating the WPI file
   bld_eFTE2_wpi eFTE2$(EFTE2_VER).wpi

clean: .symbolic
  -if exist eFTE2$(EFTE2_VER).wpi del eFTE2$(EFTE2_VER).wpi
  -if exist bld_eFTE2_wpidirs.in del bld_eFTE2_wpidirs.in
  -@rm *.*~
#  clean_wpidirs

# fixme to decide if these should be cleaned and not distcleaned
distclean: clean .symbolic
  -if exist eFTE2.wis del eFTE2.wis

# The end
