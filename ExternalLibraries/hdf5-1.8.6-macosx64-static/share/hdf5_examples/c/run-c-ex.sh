#! /bin/sh
#
# Copyright by The HDF Group.
# All rights reserved.
#
# This file is part of HDF5.  The full HDF5 copyright notice, including
# terms governing use, modification, and redistribution, is contained in
# the files COPYING and Copyright.html.  COPYING can be found at the root
# of the source code distribution tree; Copyright.html can be found at the
# root level of an installed copy of the electronic HDF5 document set and
# is linked from the top-level documents page.  It can also be found at
# http://hdfgroup.org/HDF5/doc/Copyright.html.  If you do not have
# access to either file, you may request a copy from help@hdfgroup.org.

#
#  This file:  run-c-ex.sh
# Written by:  Larry Knox
#       Date:  May 11, 2010
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                               #
# This script will compile and run the c examples from source files installed   #
# in .../share/hdf5_examples/c using h5cc or h5pc.  The order for running       #
# programs with RunTest in the MAIN section below is taken from the Makefile.   #
# The order is important since some of the test programs use data files created #
# by earlier test programs.  Any future additions should be placed accordingly. #
#                                                                               #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Initializations
EXIT_SUCCESS=0
EXIT_FAILURE=1
 
# Where the tool is installed.
# Note: no '/' after DESTDIR.  Explanation in commence.am
prefix="${prefix:-../../../}"
PARALLEL=no             # Am I in parallel mode?
AR="ar"
RANLIB="ranlib"
if [ "$PARALLEL" = no ]; then
    H5TOOL="h5cc"               # The tool name
else
    H5TOOL="h5pcc"               # The tool name
fi
H5TOOL_BIN="${prefix}/bin/${H5TOOL}"   # The path of the tool binary

#### Run test ####
RunTest()
{
    Test=$1".c"

    echo
    echo "#################  $1  #################"
    ${H5TOOL_BIN} $Test
    if [ $? -ne 0 ]
    then
        echo "messed up compiling $Test"
        exit 1
    fi
    ./a.out
}



##################  MAIN  ##################

if ! test -d red; then
   mkdir red
fi
if ! test -d blue; then
   mkdir blue
fi
if ! test -d u2w; then
   mkdir u2w
fi

# Run tests
if [ $? -eq 0 ]
then
    if (RunTest h5_write &&\
        RunTest h5_read &&\
        RunTest h5_extend_write &&\
        RunTest h5_chunk_read &&\
        RunTest h5_compound &&\
        RunTest h5_group &&\
        RunTest h5_select &&\
        RunTest h5_attribute &&\
        RunTest h5_mount &&\
        RunTest h5_reference &&\
        RunTest h5_drivers &&\
        RunTest h5_ref2reg &&\
        RunTest h5_extlink &&\
        RunTest h5_elink_unix2win &&\
        RunTest h5_shared_mesg); then
        EXIT_VALUE=${EXIT_SUCCESS}
    else
        EXIT_VALUE=${EXIT_FAILURE}
    fi
fi

# Cleanup
rm a.out
rm *.o
rm *.h5
rm -rf red blue u2w
echo

exit $EXIT_VALUE 

