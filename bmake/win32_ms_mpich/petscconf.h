#ifdef PETSC_RCS_HEADER
"$Id: petscconf.h,v 1.5 2001/03/23 23:18:37 balay Exp $"
"Defines the configuration for this machine"
#endif

#if !defined(INCLUDED_PETSCCONF_H)
#define INCLUDED_PETSCCONF_H

#define PARCH_win32 
#define PETSC_ARCH_NAME "win32_ms_mpich"
#define PETSC_HAVE_WIN32
#define PETSC_HAVE_LIMITS_H
#define PETSC_HAVE_STDLIB_H 
#define PETSC_HAVE_STRING_H 
#define PETSC_HAVE_SEARCH_H
#define PETSC_HAVE_IO_H

#define PETSC_HAVE_STD_COMPLEX
#define PETSC_HAVE_FORTRAN_CAPS 

#define PETSC_HAVE_READLINK
#define PETSC_HAVE_MEMMOVE

#define PETSC_HAVE_RAND
#define PETSC_CANNOT_START_DEBUGGER
#define PETSC_HAVE_CLOCK

#define PETSC_HAVE_GET_USER_NAME
#define PETSC_SIZEOF_VOIDP 4
#define PETSC_SIZEOF_INT 4
#define PETSC_SIZEOF_DOUBLE 8

#define PETSC_USE_NT_TIME
#define PETSC_HAVE_NO_GETRUSAGE

#define PETSC_HAVE_F90_H "f90impl/f90_win32.h"
#define PETSC_HAVE_F90_C "src/sys/src/f90/f90_win32.c"

#define PETSC_MISSING_SIGBUS
#define PETSC_MISSING_SIGQUIT
#define PETSC_MISSING_SIGSYS

#define PETSC_HAVE_U_ACCESS
#define PETSC_HAVE_U_GETCWD
#define PETSC_HAVE_U_SLEEP
#define PETSC_USE_NARGS
#define PETSC_HAVE_IARG_COUNT_PROGNAME

#endif
