# Makefile.in generated by automake 1.11.1 from Makefile.am.
# nc_test/Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,
# 2003, 2004, 2005, 2006, 2007, 2008, 2009  Free Software Foundation,
# Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.



# Copyright 2005, see the COPYRIGHT file for more information.

# This file builds and runs the nc_test program, which tests the
# netCDF-3 API for all formats.

# $Id: Makefile.am,v 1.65 2010/05/29 00:43:23 dmh Exp $

pkgdatadir = $(datadir)/netcdf
pkgincludedir = $(includedir)/netcdf
pkglibdir = $(libdir)/netcdf
pkglibexecdir = $(libexecdir)/netcdf
am__cd = CDPATH="$${ZSH_VERSION+.}$(PATH_SEPARATOR)" && cd
install_sh_DATA = $(install_sh) -c -m 644
install_sh_PROGRAM = $(install_sh) -c
install_sh_SCRIPT = $(install_sh) -c
INSTALL_HEADER = $(INSTALL_DATA)
transform = $(program_transform_name)
NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
build_triplet = x86_64-apple-darwin
host_triplet = x86_64-apple-darwin
target_triplet = x86_64-apple-darwin
am__append_1 = tst_atts

# If the user asked for large file tests, then add them.
#am__append_2 = quick_large_files tst_big_var6 tst_big_var2	\
#tst_big_rvar tst_big_var tst_large large_files

check_PROGRAMS = $(am__EXEEXT_3)
TESTS = $(am__EXEEXT_3) $(am__append_3)
#am__append_3 = run_valgrind_tests.sh
subdir = nc_test
DIST_COMMON = $(srcdir)/Makefile.am $(srcdir)/Makefile.in
ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
am__aclocal_m4_deps = $(top_srcdir)/m4/libtool.m4 \
	$(top_srcdir)/m4/ltoptions.m4 $(top_srcdir)/m4/ltsugar.m4 \
	$(top_srcdir)/m4/ltversion.m4 $(top_srcdir)/m4/lt~obsolete.m4 \
	$(top_srcdir)/acinclude.m4 $(top_srcdir)/configure.ac
am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
	$(ACLOCAL_M4)
mkinstalldirs = $(install_sh) -d
CONFIG_HEADER = $(top_builddir)/config.h \
	$(top_builddir)/fortran/nfconfig1.inc
CONFIG_CLEAN_FILES =
CONFIG_CLEAN_VPATH_FILES =
am__EXEEXT_1 = tst_atts$(EXEEXT)
#am__EXEEXT_2 = quick_large_files$(EXEEXT) \
#	tst_big_var6$(EXEEXT) \
#	tst_big_var2$(EXEEXT) \
#	tst_big_rvar$(EXEEXT) \
#	tst_big_var$(EXEEXT) tst_large$(EXEEXT) \
#	large_files$(EXEEXT)
am__EXEEXT_3 = t_nc$(EXEEXT) tst_small$(EXEEXT) nc_test$(EXEEXT) \
	tst_misc$(EXEEXT) tst_norm$(EXEEXT) tst_names$(EXEEXT) \
	$(am__EXEEXT_1) $(am__EXEEXT_2)
large_files_SOURCES = large_files.c
large_files_OBJECTS = large_files.$(OBJEXT)
large_files_LDADD = $(LDADD)
large_files_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
am_nc_test_OBJECTS = nc_test.$(OBJEXT) error.$(OBJEXT) \
	test_get.$(OBJEXT) test_put.$(OBJEXT) test_read.$(OBJEXT) \
	test_write.$(OBJEXT) util.$(OBJEXT)
nc_test_OBJECTS = $(am_nc_test_OBJECTS)
nc_test_LDADD = $(LDADD)
nc_test_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
quick_large_files_SOURCES = quick_large_files.c
quick_large_files_OBJECTS = quick_large_files.$(OBJEXT)
quick_large_files_LDADD = $(LDADD)
quick_large_files_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
t_nc_SOURCES = t_nc.c
t_nc_OBJECTS = t_nc.$(OBJEXT)
t_nc_LDADD = $(LDADD)
t_nc_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_atts_SOURCES = tst_atts.c
tst_atts_OBJECTS = tst_atts.$(OBJEXT)
tst_atts_LDADD = $(LDADD)
tst_atts_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_big_rvar_SOURCES = tst_big_rvar.c
tst_big_rvar_OBJECTS = tst_big_rvar.$(OBJEXT)
tst_big_rvar_LDADD = $(LDADD)
tst_big_rvar_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_big_var_SOURCES = tst_big_var.c
tst_big_var_OBJECTS = tst_big_var.$(OBJEXT)
tst_big_var_LDADD = $(LDADD)
tst_big_var_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_big_var2_SOURCES = tst_big_var2.c
tst_big_var2_OBJECTS = tst_big_var2.$(OBJEXT)
tst_big_var2_LDADD = $(LDADD)
tst_big_var2_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_big_var6_SOURCES = tst_big_var6.c
tst_big_var6_OBJECTS = tst_big_var6.$(OBJEXT)
tst_big_var6_LDADD = $(LDADD)
tst_big_var6_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_large_SOURCES = tst_large.c
tst_large_OBJECTS = tst_large.$(OBJEXT)
tst_large_LDADD = $(LDADD)
tst_large_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_misc_SOURCES = tst_misc.c
tst_misc_OBJECTS = tst_misc.$(OBJEXT)
tst_misc_LDADD = $(LDADD)
tst_misc_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_names_SOURCES = tst_names.c
tst_names_OBJECTS = tst_names.$(OBJEXT)
tst_names_LDADD = $(LDADD)
tst_names_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_norm_SOURCES = tst_norm.c
tst_norm_OBJECTS = tst_norm.$(OBJEXT)
tst_norm_LDADD = $(LDADD)
tst_norm_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
tst_small_SOURCES = tst_small.c
tst_small_OBJECTS = tst_small.$(OBJEXT)
tst_small_LDADD = $(LDADD)
tst_small_DEPENDENCIES = ${top_builddir}/liblib/libnetcdf.la
DEFAULT_INCLUDES = -I. -I$(top_builddir) -I$(top_builddir)/fortran
depcomp = $(SHELL) $(top_srcdir)/depcomp
am__depfiles_maybe = depfiles
am__mv = mv -f
COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
LTCOMPILE = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) \
	--mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
	$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
CCLD = $(CC)
LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) \
	--mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
	$(LDFLAGS) -o $@
SOURCES = large_files.c $(nc_test_SOURCES) quick_large_files.c t_nc.c \
	tst_atts.c tst_big_rvar.c tst_big_var.c tst_big_var2.c \
	tst_big_var6.c tst_large.c tst_misc.c tst_names.c tst_norm.c \
	tst_small.c
DIST_SOURCES = large_files.c $(nc_test_SOURCES) quick_large_files.c \
	t_nc.c tst_atts.c tst_big_rvar.c tst_big_var.c tst_big_var2.c \
	tst_big_var6.c tst_large.c tst_misc.c tst_names.c tst_norm.c \
	tst_small.c
ETAGS = etags
CTAGS = ctags
am__tty_colors = \
red=; grn=; lgn=; blu=; std=
DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
ACLOCAL = ${SHELL} /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/missing --run aclocal-1.11
ALLOCA = 
AMTAR = ${SHELL} /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/missing --run tar
AR = ar
AS = as
AUTOCONF = ${SHELL} /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/missing --run autoconf
AUTOHEADER = ${SHELL} /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/missing --run autoheader
AUTOMAKE = ${SHELL} /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/missing --run automake-1.11
AWK = awk
BINFILE_NAME = binary-netcdf-4.1.2_g++.tar
CC = gcc
CCDEPMODE = depmode=gcc3
CFLAGS = -g -m64
CPP = gcc -E
CPPFLAGS =  -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include
CURLDIR = /usr
CURL_CFLAGS = 
CURL_FCFLAGS = 
CURL_FFLAGS = 
CURL_LIBS = -lcurl
CXX = g++
CXXCPP = g++ -E
CXXDEPMODE = depmode=gcc3
CXXFLAGS = -g -m64
CYGPATH_W = echo
DEFS = -DHAVE_CONFIG_H
DEPDIR = .deps
DLLTOOL = false
DSYMUTIL = dsymutil
DUMPBIN = 
ECHO_C = \c
ECHO_N = 
ECHO_T = 
EGREP = /usr/bin/grep -E
EXEEXT = 
EXTERN_CFLAGS =  -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include 
EXTERN_CPPFLAGS =  -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include -I/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/include 
EXTERN_LDFLAGS =  -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -lhdf5_hl -lhdf5 -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -lz -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -lsz -lcurl
F77 = x86_64-apple-darwin-gfortran
FC = x86_64-apple-darwin-gfortran
FCFLAGS = -g -O2
FCFLAGS_f90 = 
FFLAGS = -g -O2
FGREP = /usr/bin/grep -F
FTPBINDIR = /home/ftp/pub/binary/dummy_system
GREP = /usr/bin/grep
HAS_CXX = yes
HAS_DAP = yes
HAS_F77 = no
HAS_F90 = no
HAS_HDF4 = no
HAS_HDF5 = yes
HAS_NC2 = yes
HAS_NC4 = yes
HAS_PNETCDF = no
HAS_SZLIB = yes
HDF4DIR = 
HDF5DIR = /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static
INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_STRIP_PROGRAM = $(install_sh) -c -s
LD = /usr/libexec/gcc/i686-apple-darwin10/4.2.1/ld
LDFLAGS = -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib
LIBOBJS = 
LIBS = -lhdf5_hl -lhdf5 -lz -lsz
LIBTOOL = $(SHELL) $(top_builddir)/libtool
LIPO = lipo
LN_S = ln -s
LTLIBOBJS = 
MAKEINFO = ${SHELL} /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/missing --run makeinfo
MAKEWHATIS_CMD = 
MANIFEST_TOOL = :
MKDIR_P = .././install-sh -c -d
MOD_FLAG = 
NC_FLIBS = -lnetcdff -lnetcdf
NC_LIBS = -lnetcdf
NETCDF_C_LIB = 
NM = /usr/bin/nm
NMEDIT = nmedit
NMFLAGS = 
OBJDUMP = false
OBJEXT = o
OTOOL = otool
OTOOL64 = :
PACKAGE = netcdf
PACKAGE_BUGREPORT = support-netcdf@unidata.ucar.edu
PACKAGE_NAME = netCDF
PACKAGE_STRING = netCDF 4.1.2
PACKAGE_TARNAME = netcdf
PACKAGE_URL = 
PACKAGE_VERSION = 4.1.2
PATH_SEPARATOR = :
PNETCDFDIR = 
RANLIB = ranlib
SED = /usr/bin/sed
SET_MAKE = 
SHELL = /bin/sh
STRIP = strip
SZLIBDIR = /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static
VERSION = 4.1.2
WHATIS = whatis
ZLIBDIR = /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static
abs_builddir = /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/nc_test
abs_srcdir = /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/nc_test
abs_top_builddir = /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2
abs_top_srcdir = /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2
ac_ct_AR = ar
ac_ct_CC = 
ac_ct_CXX = g++
ac_ct_DUMPBIN = 
ac_ct_F77 = 
ac_ct_FC = 
am__include = include
am__leading_dot = .
am__quote = 
am__tar = ${AMTAR} chof - "$$tardir"
am__untar = ${AMTAR} xf -
bindir = ${exec_prefix}/bin
build = x86_64-apple-darwin
build_alias = x86_64-apple-darwin
build_cpu = x86_64
build_os = darwin
build_vendor = apple
builddir = .
datadir = ${datarootdir}
datarootdir = ${prefix}/share
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
dvidir = ${docdir}
exec_prefix = ${prefix}
host = x86_64-apple-darwin
host_alias = x86_64-apple-darwin
host_cpu = x86_64
host_os = darwin
host_vendor = apple
htmldir = ${docdir}
includedir = ${prefix}/include
infodir = ${datarootdir}/info
install_sh = ${SHELL} /Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/netcdf-4.1.2/install-sh
libdir = ${exec_prefix}/lib
libexecdir = ${exec_prefix}/libexec
localedir = ${datarootdir}/locale
localstatedir = ${prefix}/var
mandir = ${datarootdir}/man
mkdir_p = $(top_builddir)/./install-sh -c -d
oldincludedir = /usr/include
pdfdir = ${docdir}
prefix = /usr/local
prog = 
program_transform_name = s&^&x86_64-apple-darwin-&
psdir = ${docdir}
sbindir = ${exec_prefix}/sbin
sharedstatedir = ${prefix}/com
srcdir = .
subdirs =  udunits libcf
sysconfdir = ${prefix}/etc
target = x86_64-apple-darwin
target_alias = x86_64-apple-darwin
target_cpu = x86_64
target_os = darwin
target_vendor = apple
top_build_prefix = ../
top_builddir = ..
top_srcdir = ..
LDADD = -lm ${top_builddir}/liblib/libnetcdf.la  -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -lhdf5_hl -lhdf5 -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -lz -L/Users/jearly/Documents/Projects/Single_Layer_PV_Modeling/GLNumericalModelingKit/GLNumericalModelingKit/ExternalLibraries/hdf5-1.8.6-macosx64-static/lib -lsz -lcurl
AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/liblib

# These files are created by the tests.
CLEANFILES = nc_test_classic.nc nc_test_64bit.nc nc_test_netcdf4.nc	\
tst_*.nc t_nc.nc large_files.nc quick_large_files.nc 


# These are the tests which are always run.
TESTPROGRAMS = t_nc tst_small nc_test tst_misc tst_norm tst_names \
	$(am__append_1) $(am__append_2)

# These are the source files for the main workhorse test program,
# nc_test. If you pass nc_test, you are doing well.
nc_test_SOURCES = nc_test.c error.c test_get.m4 test_put.m4 \
test_read.c test_write.c util.c error.h tests.h 

##TESTS_ENVIRONMENT = USE_NETCDF4=0

# This will run a bunch of the test programs with valgrind, the memory
# checking tool. (Valgrind must be present for this to work.)
#TESTS_ENVIRONMENT = USE_NETCDF4=1

# Distribute the .c files so that m4 isn't required on the users
# machine.
EXTRA_DIST = test_get.c test_put.c run_valgrind_tests.sh

# Only clean these on mainatiner-clean, because they require m4 to
# regenerate.
MAINTAINERCLEANFILES = test_get.c test_put.c
all: all-am

.SUFFIXES:
.SUFFIXES: .c .lo .m4 .o .obj
$(srcdir)/Makefile.in:  $(srcdir)/Makefile.am  $(am__configure_deps)
	@for dep in $?; do \
	  case '$(am__configure_deps)' in \
	    *$$dep*) \
	      ( cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh ) \
	        && { if test -f $@; then exit 0; else break; fi; }; \
	      exit 1;; \
	  esac; \
	done; \
	echo ' cd $(top_srcdir) && $(AUTOMAKE) --foreign nc_test/Makefile'; \
	$(am__cd) $(top_srcdir) && \
	  $(AUTOMAKE) --foreign nc_test/Makefile
.PRECIOUS: Makefile
Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
	@case '$?' in \
	  *config.status*) \
	    cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh;; \
	  *) \
	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe)'; \
	    cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe);; \
	esac;

$(top_builddir)/config.status: $(top_srcdir)/configure $(CONFIG_STATUS_DEPENDENCIES)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh

$(top_srcdir)/configure:  $(am__configure_deps)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
$(ACLOCAL_M4):  $(am__aclocal_m4_deps)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
$(am__aclocal_m4_deps):

clean-checkPROGRAMS:
	@list='$(check_PROGRAMS)'; test -n "$$list" || exit 0; \
	echo " rm -f" $$list; \
	rm -f $$list || exit $$?; \
	test -n "$(EXEEXT)" || exit 0; \
	list=`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`; \
	echo " rm -f" $$list; \
	rm -f $$list
large_files$(EXEEXT): $(large_files_OBJECTS) $(large_files_DEPENDENCIES) 
	@rm -f large_files$(EXEEXT)
	$(LINK) $(large_files_OBJECTS) $(large_files_LDADD) $(LIBS)
nc_test$(EXEEXT): $(nc_test_OBJECTS) $(nc_test_DEPENDENCIES) 
	@rm -f nc_test$(EXEEXT)
	$(LINK) $(nc_test_OBJECTS) $(nc_test_LDADD) $(LIBS)
quick_large_files$(EXEEXT): $(quick_large_files_OBJECTS) $(quick_large_files_DEPENDENCIES) 
	@rm -f quick_large_files$(EXEEXT)
	$(LINK) $(quick_large_files_OBJECTS) $(quick_large_files_LDADD) $(LIBS)
t_nc$(EXEEXT): $(t_nc_OBJECTS) $(t_nc_DEPENDENCIES) 
	@rm -f t_nc$(EXEEXT)
	$(LINK) $(t_nc_OBJECTS) $(t_nc_LDADD) $(LIBS)
tst_atts$(EXEEXT): $(tst_atts_OBJECTS) $(tst_atts_DEPENDENCIES) 
	@rm -f tst_atts$(EXEEXT)
	$(LINK) $(tst_atts_OBJECTS) $(tst_atts_LDADD) $(LIBS)
tst_big_rvar$(EXEEXT): $(tst_big_rvar_OBJECTS) $(tst_big_rvar_DEPENDENCIES) 
	@rm -f tst_big_rvar$(EXEEXT)
	$(LINK) $(tst_big_rvar_OBJECTS) $(tst_big_rvar_LDADD) $(LIBS)
tst_big_var$(EXEEXT): $(tst_big_var_OBJECTS) $(tst_big_var_DEPENDENCIES) 
	@rm -f tst_big_var$(EXEEXT)
	$(LINK) $(tst_big_var_OBJECTS) $(tst_big_var_LDADD) $(LIBS)
tst_big_var2$(EXEEXT): $(tst_big_var2_OBJECTS) $(tst_big_var2_DEPENDENCIES) 
	@rm -f tst_big_var2$(EXEEXT)
	$(LINK) $(tst_big_var2_OBJECTS) $(tst_big_var2_LDADD) $(LIBS)
tst_big_var6$(EXEEXT): $(tst_big_var6_OBJECTS) $(tst_big_var6_DEPENDENCIES) 
	@rm -f tst_big_var6$(EXEEXT)
	$(LINK) $(tst_big_var6_OBJECTS) $(tst_big_var6_LDADD) $(LIBS)
tst_large$(EXEEXT): $(tst_large_OBJECTS) $(tst_large_DEPENDENCIES) 
	@rm -f tst_large$(EXEEXT)
	$(LINK) $(tst_large_OBJECTS) $(tst_large_LDADD) $(LIBS)
tst_misc$(EXEEXT): $(tst_misc_OBJECTS) $(tst_misc_DEPENDENCIES) 
	@rm -f tst_misc$(EXEEXT)
	$(LINK) $(tst_misc_OBJECTS) $(tst_misc_LDADD) $(LIBS)
tst_names$(EXEEXT): $(tst_names_OBJECTS) $(tst_names_DEPENDENCIES) 
	@rm -f tst_names$(EXEEXT)
	$(LINK) $(tst_names_OBJECTS) $(tst_names_LDADD) $(LIBS)
tst_norm$(EXEEXT): $(tst_norm_OBJECTS) $(tst_norm_DEPENDENCIES) 
	@rm -f tst_norm$(EXEEXT)
	$(LINK) $(tst_norm_OBJECTS) $(tst_norm_LDADD) $(LIBS)
tst_small$(EXEEXT): $(tst_small_OBJECTS) $(tst_small_DEPENDENCIES) 
	@rm -f tst_small$(EXEEXT)
	$(LINK) $(tst_small_OBJECTS) $(tst_small_LDADD) $(LIBS)

mostlyclean-compile:
	-rm -f *.$(OBJEXT)

distclean-compile:
	-rm -f *.tab.c

include ./$(DEPDIR)/error.Po
include ./$(DEPDIR)/large_files.Po
include ./$(DEPDIR)/nc_test.Po
include ./$(DEPDIR)/quick_large_files.Po
include ./$(DEPDIR)/t_nc.Po
include ./$(DEPDIR)/test_get.Po
include ./$(DEPDIR)/test_put.Po
include ./$(DEPDIR)/test_read.Po
include ./$(DEPDIR)/test_write.Po
include ./$(DEPDIR)/tst_atts.Po
include ./$(DEPDIR)/tst_big_rvar.Po
include ./$(DEPDIR)/tst_big_var.Po
include ./$(DEPDIR)/tst_big_var2.Po
include ./$(DEPDIR)/tst_big_var6.Po
include ./$(DEPDIR)/tst_large.Po
include ./$(DEPDIR)/tst_misc.Po
include ./$(DEPDIR)/tst_names.Po
include ./$(DEPDIR)/tst_norm.Po
include ./$(DEPDIR)/tst_small.Po
include ./$(DEPDIR)/util.Po

.c.o:
	depbase=`echo $@ | sed 's|[^/]*$$|$(DEPDIR)/&|;s|\.o$$||'`;\
	$(COMPILE) -MT $@ -MD -MP -MF $$depbase.Tpo -c -o $@ $< &&\
	$(am__mv) $$depbase.Tpo $$depbase.Po
#	source='$<' object='$@' libtool=no \
#	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
#	$(COMPILE) -c -o $@ $<

.c.obj:
	depbase=`echo $@ | sed 's|[^/]*$$|$(DEPDIR)/&|;s|\.obj$$||'`;\
	$(COMPILE) -MT $@ -MD -MP -MF $$depbase.Tpo -c -o $@ `$(CYGPATH_W) '$<'` &&\
	$(am__mv) $$depbase.Tpo $$depbase.Po
#	source='$<' object='$@' libtool=no \
#	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
#	$(COMPILE) -c -o $@ `$(CYGPATH_W) '$<'`

.c.lo:
	depbase=`echo $@ | sed 's|[^/]*$$|$(DEPDIR)/&|;s|\.lo$$||'`;\
	$(LTCOMPILE) -MT $@ -MD -MP -MF $$depbase.Tpo -c -o $@ $< &&\
	$(am__mv) $$depbase.Tpo $$depbase.Plo
#	source='$<' object='$@' libtool=yes \
#	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
#	$(LTCOMPILE) -c -o $@ $<

mostlyclean-libtool:
	-rm -f *.lo

clean-libtool:
	-rm -rf .libs _libs

ID: $(HEADERS) $(SOURCES) $(LISP) $(TAGS_FILES)
	list='$(SOURCES) $(HEADERS) $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '{ files[$$0] = 1; nonempty = 1; } \
	      END { if (nonempty) { for (i in files) print i; }; }'`; \
	mkid -fID $$unique
tags: TAGS

TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) \
		$(TAGS_FILES) $(LISP)
	set x; \
	here=`pwd`; \
	list='$(SOURCES) $(HEADERS)  $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '{ files[$$0] = 1; nonempty = 1; } \
	      END { if (nonempty) { for (i in files) print i; }; }'`; \
	shift; \
	if test -z "$(ETAGS_ARGS)$$*$$unique"; then :; else \
	  test -n "$$unique" || unique=$$empty_fix; \
	  if test $$# -gt 0; then \
	    $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
	      "$$@" $$unique; \
	  else \
	    $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
	      $$unique; \
	  fi; \
	fi
ctags: CTAGS
CTAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) \
		$(TAGS_FILES) $(LISP)
	list='$(SOURCES) $(HEADERS)  $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '{ files[$$0] = 1; nonempty = 1; } \
	      END { if (nonempty) { for (i in files) print i; }; }'`; \
	test -z "$(CTAGS_ARGS)$$unique" \
	  || $(CTAGS) $(CTAGSFLAGS) $(AM_CTAGSFLAGS) $(CTAGS_ARGS) \
	     $$unique

GTAGS:
	here=`$(am__cd) $(top_builddir) && pwd` \
	  && $(am__cd) $(top_srcdir) \
	  && gtags -i $(GTAGS_ARGS) "$$here"

distclean-tags:
	-rm -f TAGS ID GTAGS GRTAGS GSYMS GPATH tags

check-TESTS: $(TESTS)
	@failed=0; all=0; xfail=0; xpass=0; skip=0; \
	srcdir=$(srcdir); export srcdir; \
	list=' $(TESTS) '; \
	$(am__tty_colors); \
	if test -n "$$list"; then \
	  for tst in $$list; do \
	    if test -f ./$$tst; then dir=./; \
	    elif test -f $$tst; then dir=; \
	    else dir="$(srcdir)/"; fi; \
	    if $(TESTS_ENVIRONMENT) $${dir}$$tst; then \
	      all=`expr $$all + 1`; \
	      case " $(XFAIL_TESTS) " in \
	      *[\ \	]$$tst[\ \	]*) \
		xpass=`expr $$xpass + 1`; \
		failed=`expr $$failed + 1`; \
		col=$$red; res=XPASS; \
	      ;; \
	      *) \
		col=$$grn; res=PASS; \
	      ;; \
	      esac; \
	    elif test $$? -ne 77; then \
	      all=`expr $$all + 1`; \
	      case " $(XFAIL_TESTS) " in \
	      *[\ \	]$$tst[\ \	]*) \
		xfail=`expr $$xfail + 1`; \
		col=$$lgn; res=XFAIL; \
	      ;; \
	      *) \
		failed=`expr $$failed + 1`; \
		col=$$red; res=FAIL; \
	      ;; \
	      esac; \
	    else \
	      skip=`expr $$skip + 1`; \
	      col=$$blu; res=SKIP; \
	    fi; \
	    echo "$${col}$$res$${std}: $$tst"; \
	  done; \
	  if test "$$all" -eq 1; then \
	    tests="test"; \
	    All=""; \
	  else \
	    tests="tests"; \
	    All="All "; \
	  fi; \
	  if test "$$failed" -eq 0; then \
	    if test "$$xfail" -eq 0; then \
	      banner="$$All$$all $$tests passed"; \
	    else \
	      if test "$$xfail" -eq 1; then failures=failure; else failures=failures; fi; \
	      banner="$$All$$all $$tests behaved as expected ($$xfail expected $$failures)"; \
	    fi; \
	  else \
	    if test "$$xpass" -eq 0; then \
	      banner="$$failed of $$all $$tests failed"; \
	    else \
	      if test "$$xpass" -eq 1; then passes=pass; else passes=passes; fi; \
	      banner="$$failed of $$all $$tests did not behave as expected ($$xpass unexpected $$passes)"; \
	    fi; \
	  fi; \
	  dashes="$$banner"; \
	  skipped=""; \
	  if test "$$skip" -ne 0; then \
	    if test "$$skip" -eq 1; then \
	      skipped="($$skip test was not run)"; \
	    else \
	      skipped="($$skip tests were not run)"; \
	    fi; \
	    test `echo "$$skipped" | wc -c` -le `echo "$$banner" | wc -c` || \
	      dashes="$$skipped"; \
	  fi; \
	  report=""; \
	  if test "$$failed" -ne 0 && test -n "$(PACKAGE_BUGREPORT)"; then \
	    report="Please report to $(PACKAGE_BUGREPORT)"; \
	    test `echo "$$report" | wc -c` -le `echo "$$banner" | wc -c` || \
	      dashes="$$report"; \
	  fi; \
	  dashes=`echo "$$dashes" | sed s/./=/g`; \
	  if test "$$failed" -eq 0; then \
	    echo "$$grn$$dashes"; \
	  else \
	    echo "$$red$$dashes"; \
	  fi; \
	  echo "$$banner"; \
	  test -z "$$skipped" || echo "$$skipped"; \
	  test -z "$$report" || echo "$$report"; \
	  echo "$$dashes$$std"; \
	  test "$$failed" -eq 0; \
	else :; fi

distdir: $(DISTFILES)
	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
	topsrcdirstrip=`echo "$(top_srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
	list='$(DISTFILES)'; \
	  dist_files=`for file in $$list; do echo $$file; done | \
	  sed -e "s|^$$srcdirstrip/||;t" \
	      -e "s|^$$topsrcdirstrip/|$(top_builddir)/|;t"`; \
	case $$dist_files in \
	  */*) $(MKDIR_P) `echo "$$dist_files" | \
			   sed '/\//!d;s|^|$(distdir)/|;s,/[^/]*$$,,' | \
			   sort -u` ;; \
	esac; \
	for file in $$dist_files; do \
	  if test -f $$file || test -d $$file; then d=.; else d=$(srcdir); fi; \
	  if test -d $$d/$$file; then \
	    dir=`echo "/$$file" | sed -e 's,/[^/]*$$,,'`; \
	    if test -d "$(distdir)/$$file"; then \
	      find "$(distdir)/$$file" -type d ! -perm -700 -exec chmod u+rwx {} \;; \
	    fi; \
	    if test -d $(srcdir)/$$file && test $$d != $(srcdir); then \
	      cp -fpR $(srcdir)/$$file "$(distdir)$$dir" || exit 1; \
	      find "$(distdir)/$$file" -type d ! -perm -700 -exec chmod u+rwx {} \;; \
	    fi; \
	    cp -fpR $$d/$$file "$(distdir)$$dir" || exit 1; \
	  else \
	    test -f "$(distdir)/$$file" \
	    || cp -p $$d/$$file "$(distdir)/$$file" \
	    || exit 1; \
	  fi; \
	done
check-am: all-am
	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
	$(MAKE) $(AM_MAKEFLAGS) check-TESTS
check: check-am
all-am: Makefile
installdirs:
install: install-am
install-exec: install-exec-am
install-data: install-data-am
uninstall: uninstall-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am

installcheck: installcheck-am
install-strip:
	$(MAKE) $(AM_MAKEFLAGS) INSTALL_PROGRAM="$(INSTALL_STRIP_PROGRAM)" \
	  install_sh_PROGRAM="$(INSTALL_STRIP_PROGRAM)" INSTALL_STRIP_FLAG=-s \
	  `test -z '$(STRIP)' || \
	    echo "INSTALL_PROGRAM_ENV=STRIPPROG='$(STRIP)'"` install
mostlyclean-generic:

clean-generic:
	-test -z "$(CLEANFILES)" || rm -f $(CLEANFILES)

distclean-generic:
	-test -z "$(CONFIG_CLEAN_FILES)" || rm -f $(CONFIG_CLEAN_FILES)
	-test . = "$(srcdir)" || test -z "$(CONFIG_CLEAN_VPATH_FILES)" || rm -f $(CONFIG_CLEAN_VPATH_FILES)

maintainer-clean-generic:
	@echo "This command is intended for maintainers to use"
	@echo "it deletes files that may require special tools to rebuild."
	-test -z "$(MAINTAINERCLEANFILES)" || rm -f $(MAINTAINERCLEANFILES)
clean: clean-am

clean-am: clean-checkPROGRAMS clean-generic clean-libtool \
	mostlyclean-am

distclean: distclean-am
	-rm -rf ./$(DEPDIR)
	-rm -f Makefile
distclean-am: clean-am distclean-compile distclean-generic \
	distclean-tags

dvi: dvi-am

dvi-am:

html: html-am

html-am:

info: info-am

info-am:

install-data-am:

install-dvi: install-dvi-am

install-dvi-am:

install-exec-am:

install-html: install-html-am

install-html-am:

install-info: install-info-am

install-info-am:

install-man:

install-pdf: install-pdf-am

install-pdf-am:

install-ps: install-ps-am

install-ps-am:

installcheck-am:

maintainer-clean: maintainer-clean-am
	-rm -rf ./$(DEPDIR)
	-rm -f Makefile
maintainer-clean-am: distclean-am maintainer-clean-generic

mostlyclean: mostlyclean-am

mostlyclean-am: mostlyclean-compile mostlyclean-generic \
	mostlyclean-libtool

pdf: pdf-am

pdf-am:

ps: ps-am

ps-am:

uninstall-am:

.MAKE: check-am install-am install-strip

.PHONY: CTAGS GTAGS all all-am check check-TESTS check-am clean \
	clean-checkPROGRAMS clean-generic clean-libtool ctags \
	distclean distclean-compile distclean-generic \
	distclean-libtool distclean-tags distdir dvi dvi-am html \
	html-am info info-am install install-am install-data \
	install-data-am install-dvi install-dvi-am install-exec \
	install-exec-am install-html install-html-am install-info \
	install-info-am install-man install-pdf install-pdf-am \
	install-ps install-ps-am install-strip installcheck \
	installcheck-am installdirs maintainer-clean \
	maintainer-clean-generic mostlyclean mostlyclean-compile \
	mostlyclean-generic mostlyclean-libtool pdf pdf-am ps ps-am \
	tags uninstall uninstall-am


# This rule tells make how to turn our .m4 files into .c files.
.m4.c:
	m4 $(AM_M4FLAGS) $(M4FLAGS) $< >$@

# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
