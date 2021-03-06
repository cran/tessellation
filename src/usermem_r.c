/*<html><pre>  -<a                             href="qh-user_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

   usermem_r.c
   qh_exit(), qh_free(), and qh_malloc()

   See README.txt.

   If you redefine one of these functions you must redefine all of them.
   If you recompile and load this file, then usermem.o will not be loaded
   from qhull.a or qhull.lib

   See libqhull_r.h for data structures, macros, and user-callable functions.
   See user_r.c for qhull-related, redefinable functions
   see user_r.h for user-definable constants
   See userprintf_r.c for qh_fprintf and userprintf_rbox_r.c for qh_fprintf_rbox

   Please report any errors that you fix to qhull@qhull.org
*/

/*
 Modification by Stéphane Laurent
 On 2018-07-30
*/

#include "libqhull_r.h"

#include <stdarg.h>
#include <stdlib.h>

#include <R_ext/Error.h>
#include <R_ext/Print.h>

/*-<a                             href="qh-user_r.htm#TOC"
  >-------------------------------</a><a name="qh_exit">-</a>

  qh_exit( exitcode )
    exit program

  notes:
    qh_exit() is called when qh_errexit() and longjmp() are not available.

    This is the only use of exit() in Qhull
    To replace qh_exit with 'throw', see libqhullcpp/usermem_r-cpp.cpp
*/
void qh_exit(int exitcode) {
  error("Exit with code %d.", exitcode);
} /* exit */

/*-<a                             href="qh-user_r.htm#TOC"
  >-------------------------------</a><a name="qh_fprintf_stderr">-</a>

  qh_fprintf_stderr( msgcode, format, list of args )
    fprintf to stderr with msgcode (non-zero)

  notes:
    qh_fprintf_stderr() is called when qh->ferr is not defined, usually due to an initialization error

    It is typically followed by qh_errexit().

    Redefine this function to avoid using stderr

    Use qh_fprintf [userprintf_r.c] for normal printing
*/
void qh_fprintf_stderr(int msgcode, const char *fmt, ... ) {
  va_list args;

  va_start(args, fmt);
  if(msgcode)
    REprintf("QH%.4d ", msgcode);
  REvprintf(fmt, args);
  va_end(args);
} /* fprintf_stderr */

/*-<a                             href="qh-user_r.htm#TOC"
>-------------------------------</a><a name="qh_free">-</a>

  qh_free(qhT *qh, mem )
    free memory

  notes:
    same as free()
    No calls to qh_errexit()
*/
void qh_free(void *mem) {
    free(mem);
} /* free */

/*-<a                             href="qh-user_r.htm#TOC"
    >-------------------------------</a><a name="qh_malloc">-</a>

    qh_malloc( mem )
      allocate memory

    notes:
      same as malloc()
*/
void *qh_malloc(size_t size) {
    return malloc(size);
} /* malloc */


